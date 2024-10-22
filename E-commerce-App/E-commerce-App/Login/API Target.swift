//
//  API Target.swift
//  E-commerce-App
//
//  Created by Andy on 14/10/2024.
//

import UIKit
import Moya

enum APITarget: TargetType {
    case login(user: String, password: String)
    case creatAcc(user: String, password: String, confirmPw: String)
    case forgotPassword(email: String)
    
    var baseURL: URL {
        switch self {
            
        case .login:
            return URL(string: "https://767decf3-97b2-4acb-a264-3a18e63fe5f9.mock.pstmn.io")!
        case .creatAcc:
            return URL(string: "https://15b90a08-b204-41c2-9e13-21cf412e0966.mock.pstmn.io")!
        case .forgotPassword:
            return URL(string: "https://014dc769-19ad-414f-ba82-805f0f70278c.mock.pstmn.io")!
        }
    }
    
    var path: String {
        switch self {
            
        case .login:
            return "/login"
        case .creatAcc:
            return "/creatAcc"
        case .forgotPassword:
            return "/findPassword"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .login, .creatAcc, .forgotPassword:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .login(let user, let password):
            return .requestParameters(parameters: ["userName": user,
                                                   "password": password], encoding: JSONEncoding.default)
        case .creatAcc(let user, let password, let confirmPw):
            return .requestParameters(parameters: ["username": user,
                                                   "password": password,
                                                   "confirmPassword": confirmPw], encoding: JSONEncoding.default)
        case .forgotPassword(let email):
            return .requestParameters(parameters: ["email": email], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Authorization": "Bearer \(SessionManager.shared.token)"]
    }
}
