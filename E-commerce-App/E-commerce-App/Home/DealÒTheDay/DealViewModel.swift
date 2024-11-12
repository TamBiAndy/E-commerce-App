//
//  DealViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 20/10/2024.
//

import UIKit
import Moya

struct DealOffTheDay: Codable {
    struct DealOff: Codable {
        let id: String?
        let image: String?
        let productName: String?
        let productDetail: String?
        let currentPrice: Int?
        let originPrice: Int?
        let percentOff: Int?
        let rating: Int?
    }
    
    let id: String?
    let timeRemain: String?
    let dealOff: [DealOff]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case dealOff = "deal_off"
        case timeRemain
    }
}

class DealViewModel {
    let provider = MoyaProvider<APITargetHomeVC>(stubClosure: MoyaProvider.delayedStub(2))
    
    var dealOff: [DealOffTheDay.DealOff] = []
    var timeRemain: String = ""
    
    func fetchData(completion: @escaping (Error?) -> Void) {
        provider.request(.getDealOfTheDay) { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let dealResponse = try decoder.decode(DealOffTheDay.self, from: response.data)
                    self.dealOff = dealResponse.dealOff ?? []
                    self.timeRemain = dealResponse.timeRemain ?? ""
                    completion(nil)
                } catch {
                    completion(error)
                    print(error)
                }
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func numberOfItem(in section: Int) -> Int {
        return dealOff.count
    }
    
    func item(at indexPath: IndexPath) -> ProductCell.ViewState {
        let item = dealOff[indexPath.row]
        
        return .init(
            imageUrl: item.image,
            title: item.productName,
            description: item.productDetail,
            currentPrice: item.currentPrice,
            originPrice: item.originPrice,
            percentOff: item.percentOff,
            rating: item.rating, 
            descripFont: .medium(size: 12)
        )
    }
}
