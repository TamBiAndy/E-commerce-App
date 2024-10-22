//
//  BottomViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 22/10/2024.
//

import UIKit
import Moya

struct SponserdResponse: Codable {
  struct Sponserd: Codable {
    let image: String?
    let detail: String?
  }

  let id: Int?
  let sponserd: Sponserd?
}

struct NewArrivalResponse: Codable {
  struct NewArrival: Codable {
    let image: String?
    let description: String?
  }

  let id: Int?
  let newArrival: NewArrival?
}

class BottomViewModel {
    let provider = MoyaProvider<APITargetHomeVC>()
    
    var sponserdInfor: SponserdResponse.Sponserd?
    
    var newArrival: NewArrivalResponse.NewArrival?
    
    func getSponser(completion: @escaping (Error?) -> Void) {
        provider.request(.getSponserdInfor) { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let sponserdResponse = try decoder.decode(SponserdResponse.self, from: response.data)
                    self.sponserdInfor = sponserdResponse.sponserd
                    completion(nil)
                } catch {
                    completion(error)
                }
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func getNewArrival(completion: @escaping (Error?) -> Void) {
        provider.request(.getNewArrival) { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let newArrivalResponse = try decoder.decode(NewArrivalResponse.self, from: response.data)
                    self.newArrival = newArrivalResponse.newArrival
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
