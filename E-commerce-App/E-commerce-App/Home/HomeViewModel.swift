//
//  HomeViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 17/10/2024.
//

import UIKit
import Moya

struct UserInfor: Codable {
  let id: String?
  let username: String?
  let email: String?
  let avatar: String?
  let createdAt: String?

  private enum CodingKeys: String, CodingKey {
    case id
    case username
    case email
    case avatar
    case createdAt = "created_at"
  }
}
class HomeViewModel {
    let provider = MoyaProvider<APITargetHomeVC>()
    
    var userInfor: UserInfor? {
        didSet {
            userInfor
        }
    }
    
    func getUserInfor(token: String, completion: @escaping (Bool) -> Void) {
        
        provider.request(.getUserInfor(token: token)) { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let userResponse = try decoder.decode(UserInfor.self, from: response.data)
                    self.userInfor = userResponse
                    completion(true)
                } catch {
                    completion(false)
                }
                
            case .failure(let error):
                completion(false)
            }
        }
        
    }
    
}
