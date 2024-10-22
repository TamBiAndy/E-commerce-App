//
//  APITargetHomeVC.swift
//  E-commerce-App
//
//  Created by Andy on 17/10/2024.
//

import UIKit
import Moya

enum APITargetHomeVC: TargetType {
    
    case getUserInfor(token: String)
    case getItemDiscovery
    case getSaleOffInfor
    case getDealOfTheDay
    case getSpecialOffer
    case getTrendingProduct
    case getSponserdInfor
    case getNewArrival
    
    var baseURL: URL {
        switch self {
        case .getUserInfor:
            return URL(string: "https://cbcf997e-8e86-4bf3-ac43-aacc95027879.mock.pstmn.io")!
        case .getItemDiscovery:
            return URL(string: "https://d975375c-b8a8-4b7b-bc43-1f0865a8d5c9.mock.pstmn.io")!
        case .getSaleOffInfor:
            return URL(string: "https://d975375c-b8a8-4b7b-bc43-1f0865a8d5c9.mock.pstmn.io")!
        case .getDealOfTheDay:
            return URL(string: "https://8a7a6f20-e7d5-4a40-8e13-b97378478bd5.mock.pstmn.io")!
        case .getSpecialOffer:
            return URL(string: "https://803837e7-7d19-403d-9af7-01701e296c46.mock.pstmn.io")!
        case .getTrendingProduct:
            return URL(string: "https://83a4a5cf-6fd3-43bd-a048-b22dad439ff6.mock.pstmn.io")!
        case .getSponserdInfor, .getNewArrival:
            return URL(string: "https://43f3f278-ea11-47e7-8375-a288d4fad135.mock.pstmn.io")!
        }
    }
    
    var path: String {
        switch self {
        case .getUserInfor:
            return "/home/userInfor"
        case .getItemDiscovery:
            return "/feature/Category"
        case .getSaleOffInfor:
            return "/feature/saleOffInfor"
        case .getDealOfTheDay:
            return "/dealOfTheDay"
        case .getSpecialOffer:
            return "/specialOffer"
        case .getTrendingProduct:
            return "/trendingProduct"
        case .getSponserdInfor:
            return "/sponserd"
        case .getNewArrival:
            return "/newArrival"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserInfor:
            return .post
        case .getItemDiscovery, .getSaleOffInfor, .getDealOfTheDay, .getSpecialOffer, .getTrendingProduct, .getNewArrival, .getSponserdInfor:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUserInfor(let token):
            return .requestParameters(parameters: ["token": token], encoding: JSONEncoding.default)
        case .getItemDiscovery, .getSaleOffInfor, .getDealOfTheDay, .getSpecialOffer, .getTrendingProduct, .getNewArrival, .getSponserdInfor:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Authorization": "Bearer \(SessionManager.shared.token)"]
    }
}
