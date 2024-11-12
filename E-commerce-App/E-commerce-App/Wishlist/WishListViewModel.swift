//
//  WishListViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 22/10/2024.
//

import UIKit
import Moya

struct WishListResponse: Codable {
    struct Product: Codable {
        let id: String?
        let image: String?
        let productName: String?
        let productDetail: String?
        let currentPrice: Int?
        let rating: Int?
    }
    
    let id: String?
    let productList: [Product]?
}

class WishListViewModel {
    let provider = MoyaProvider<APITargetHomeVC>(stubClosure: MoyaProvider.delayedStub(2))
    
    var userInfor: UserInfor?
    
    var wistList: [WishListResponse.Product] = []
    
    var itemAmount: Int?
    
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
    
    func getWishList(completion: @escaping (Error?) -> Void) {
        provider.request(.getWishList) { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let wishListResponse = try decoder.decode(WishListResponse.self, from: response.data)
                    self.wistList = wishListResponse.productList ?? []
                    self.itemAmount = wishListResponse.productList?.count
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
        return wistList.count
    }
    
    func item(at indexPath: IndexPath) -> ProductCell.ViewState {
        let item = wistList[indexPath.row]
        
        return .init(
            imageUrl: item.image,
            title: item.productName,
            description: item.productDetail,
            currentPrice: item.currentPrice,
            originPrice: nil,
            percentOff: nil,
            rating: item.rating,
            descripFont: .regular(size: 10))
    }
}
