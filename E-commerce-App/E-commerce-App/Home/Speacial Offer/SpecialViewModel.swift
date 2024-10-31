//
//  SpecialViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 21/10/2024.
//

import UIKit
import Moya

struct SpecialOffer: Codable {
  struct Offer: Codable {
    let image: String?
    let productName: String?
    let productDetail: String?
  }

  let id: String?
  let offer: Offer?
}

class SpecialViewModel {
    let provider = MoyaProvider<APITargetHomeVC>()
    
    var offer: SpecialOffer.Offer?
    
    func fetchData(completion: @escaping (Error?) -> Void) {
        provider.request(.getSpecialOffer) { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let offerResponse = try decoder.decode(SpecialOffer.self, from: response.data)
                    self.offer = offerResponse.offer
                    completion(nil)
                } catch {
                    completion(error)
                }
            case .failure(let error):
                completion(error)
            }
        }
    }
}
