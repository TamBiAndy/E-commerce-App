//
//  SimilarViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 30/10/2024.
//

import UIKit
import Moya


struct SimilarResponse: Codable {
  struct Product: Codable {
    let id: String?
    let image: String?
    let productName: String?
    let description: String?
    let currentPrice: Int?
    let rating: Int?
  }

  let id: String?
  let productList: [Product]?
}

class SimilarViewModel {
    let provider = MoyaProvider<APITargetHomeVC>()
    
    var similarResponse: [SimilarResponse.Product] = []
    var itemAmount: Int {
        similarResponse.count
    }
    
    func getData(completion: @escaping (Error?) -> Void) {
        provider.request(.getSimilarProduct) { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let similarProduct = try decoder.decode(SimilarResponse.self, from: response.data)
                    self.similarResponse = similarProduct.productList ?? []
                    completion(nil)
                } catch {
                    completion(error)
                }
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func numberOfItems(in section: Int) -> Int {
        return similarResponse.count
    }
    
    func getItem(at indexPath: IndexPath) -> ProductCell.ViewState {
        let item = similarResponse[indexPath.row]
        
        return .init(
            imageUrl: item.image,
            title: item.productName,
            description: item.description,
            currentPrice: item.currentPrice,
            originPrice: nil,
            percentOff: nil,
            rating: item.rating,
            descripFont: .regular(size: 10))
    }
}
