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
    case getWishList
    case getProductDetail(id: String?)
    case getSimilarProduct
    case getAddress
    case getProductInCart
    
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
        case .getWishList:
            return URL(string: "https://074283cd-b2fd-4697-a5ea-0af876973c91.mock.pstmn.io")!
        case .getProductDetail(let id):
            return URL(string: "https://c7cec513-392f-43c3-b012-c3b0ffcbb048.mock.pstmn.io")!
        case .getSimilarProduct:
            return URL(string: "https://12cefd4b-355b-41c5-8e48-4ab5776a1526.mock.pstmn.io")!
        case .getAddress, .getProductInCart:
            return URL(string: "https://f10202b9-e3ac-465e-aa9f-6c503c7ce72a.mock.pstmn.io")!
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
        case .getWishList:
            return "/wishList"
        case .getProductDetail(let id):
            return "/product/detail"
        case .getSimilarProduct:
            return "/similarProduct"
        case .getAddress:
            return "/cart/Address"
        case .getProductInCart:
            return "/cart/shoppingList"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserInfor:
            return .get
        case .getItemDiscovery, .getSaleOffInfor, .getDealOfTheDay, .getSpecialOffer, .getTrendingProduct, .getNewArrival, .getSponserdInfor, .getWishList, .getProductDetail, .getSimilarProduct, .getAddress, .getProductInCart:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUserInfor(let token):
            return .requestParameters(parameters: ["token": token], encoding: URLEncoding.default)
        case .getItemDiscovery, .getSaleOffInfor, .getDealOfTheDay, .getSpecialOffer, .getTrendingProduct, .getNewArrival, .getSponserdInfor, .getWishList, .getSimilarProduct, .getAddress, .getProductInCart:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .getProductDetail(let id):
            return .requestParameters(parameters: ["id": id ?? ""], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Authorization": "Bearer \(SessionManager.shared.token)"]
    }
}
