//
//  CartViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 03/11/2024.
//

import UIKit
import Moya

import Foundation

struct AddressResponse: Codable {
  struct Address: Codable {
    let address: String?
    let contact: String?
  }

  let id: String?
  let address: [Address]?
}

struct ShoppingListResponse: Codable {
  struct ShoppingList: Codable {
    let id: String?
    let image: String?
    let productName: String?
    let variations: [String]?
    let rating: Double?
    let currentPrice: Double?
    let originPrice: Double?
    let uptoPercent: Int?
    let totalOrder: Int?
  }

  let id: String?
  let shoppingList: [ShoppingList]?
}

class CartViewModel {
    let provider = MoyaProvider<APITargetHomeVC>(stubClosure: MoyaProvider.delayedStub(2))
    
    var addressList: [AddressResponse.Address] = []
    
    var shoppingListResponse: [ShoppingListResponse.ShoppingList] = []
    
    func getAddress(completion: @escaping (Error?) -> Void) {
        provider.request(.getAddress) { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let addressResponse = try decoder.decode(AddressResponse.self, from: response.data)
                    self.addressList = addressResponse.address ?? []
                    completion(nil)
                } catch {
                    completion(error)
                }
            case .failure(let error):
                completion(error)
                print(error)
            }
        }
        
    }
    
    func getShoppingList(completion: @escaping (Error?) -> Void) {
        provider.request(.getProductInCart) { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let listResponse = try decoder.decode(ShoppingListResponse.self, from: response.data)
                    self.shoppingListResponse = listResponse.shoppingList ?? []
                    completion(nil)
                } catch {
                    completion(error)
                }
            case .failure(let error):
                completion(error)
                print(error)
            }
        }
    }
    
    func getItem(at indexPath: IndexPath) -> CartTableViewCell.ViewState {
        let item = shoppingListResponse[indexPath.row]
        
        return .init(
            imageUrl: item.image,
            title: item.productName,
            color: item.variations,
            rating: item.rating,
            currentPrice: item.currentPrice,
            originPrice: item.originPrice,
            salePercent: item.uptoPercent,
            totalOrder: item.totalOrder)
    }
    
    func numberOfItems(in section: Int) -> Int? {
        return shoppingListResponse.count
    }
}

