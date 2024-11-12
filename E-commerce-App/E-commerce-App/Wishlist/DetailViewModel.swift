//
//  DetailViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 23/10/2024.
//

import UIKit
import Moya

struct ProductDetailResponse: Codable {
  struct Product: Codable {
    let id: String?
    let image: [String]?
    let productName: String?
    let description: String?
    let currentPrice: Int?
    let originPrice: Int?
    let percentOff: Int?
    let rating: Int?
    let productDetail: String?
    let size: [String]?
    let deliveryTime: String?
  }

  let id: String?
  let detail: Product?
}

class DetailViewModel {
    let provider = MoyaProvider<APITargetHomeVC>(stubClosure: MoyaProvider.delayedStub(2))
    
    var productId: String?
    
    var imageUrl: [String] = []
    
    var sizeString: [String] = []
    
    var productDetail: ProductDetailResponse.Product?
    
    init(productId: String? = nil) {
        self.productId = productId
    }
    
    func getDetail(completion: @escaping (Error?) -> Void) {
        if let productId = productId {
            provider.request(.getProductDetail(id: productId)) { result in
                switch result {
                case .success(let response):
                    let decoder = JSONDecoder()
                    do {
                        let detailResponse = try decoder.decode(ProductDetailResponse.self, from: response.data)
                        self.productDetail = detailResponse.detail
                        self.imageUrl = detailResponse.detail?.image ?? []
                        self.sizeString = detailResponse.detail?.size ?? []
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
    }
    
  
   
}
