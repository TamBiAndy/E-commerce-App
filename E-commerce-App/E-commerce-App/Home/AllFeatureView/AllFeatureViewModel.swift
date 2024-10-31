//
//  AllFeatureViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 18/10/2024.
//

import UIKit
import Moya

struct ItemCategory: Codable {
  struct Category: Codable {
    let image: String?
    let title: String?
  }

  let id: String?
  let categories: [Category]?
}

struct SaleOffInfor: Codable {
    struct SaleOff: Codable {
        let id: String?
        let image: String?
        let title: String?
        let productName: String?
        let color: String?
    }
    
    let id: String?
    let saleOff: [SaleOff]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case saleOff = "sale_off"
    }
}

class AllFeatureViewModel {
   let provider = MoyaProvider<APITargetHomeVC>()
    
    var itemCategory: [ItemCategory.Category] = []
    var saleOffInfor: [SaleOffInfor.SaleOff] = []
    
    func getItemCategory(completion: @escaping (Error?) -> Void) {
        provider.request(.getItemDiscovery) { result in
            switch result {
            case.success(let response):
                let decoder = JSONDecoder()
                
                do {
                    let itemResponse = try decoder.decode(ItemCategory.self, from: response.data)
                    self.itemCategory = itemResponse.categories ?? []
                    completion(nil)
                } catch {
                    completion(error)
                }
                
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func getSaleOffInfor(completion: @escaping (Error?) -> Void) {
        provider.request(.getSaleOffInfor) { result in
            switch result {
            case.success(let response):
                let decoder = JSONDecoder()
                
                do {
                    let saleOffResponse = try decoder.decode(SaleOffInfor.self, from: response.data)
                    self.saleOffInfor = saleOffResponse.saleOff ?? []
                    completion(nil)
                } catch {
                    completion(error)
                }
                
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfItem(isCategory: Bool) -> Int {
        if isCategory {
            itemCategory.count
        } else {
            saleOffInfor.count
        }
    }
    
    func category(at indexPath: IndexPath) -> ItemCategory.Category {
        itemCategory[indexPath.row]
    }
    
    func saleOff(at indexPath: IndexPath) -> SaleOffInfor.SaleOff {
        saleOffInfor[indexPath.row]
    }
    
    func numberOfPage() -> Int {
        saleOffInfor.count
    }
}
