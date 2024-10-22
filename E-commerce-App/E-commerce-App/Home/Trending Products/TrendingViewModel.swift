//
//  TrendingViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 22/10/2024.
//

import UIKit
import Moya

struct TrendingResponse: Codable {
  struct Trending: Codable {
    let image: String?
    let description: String?
    let currentPrice: Int?
    let originPrice: Int?
    let percentOff: Int?
  }

  let id: Int?
  let lastDate: String?
  let trending: [Trending]?
}
class TrendingViewModel {
    let provider = MoyaProvider<APITargetHomeVC>()
    var trendingResponse: [TrendingResponse.Trending] = []
    var lastDate: String = ""
    
    func fetchData(completion: @escaping (Error?) -> Void) {
        provider.request(.getTrendingProduct) { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let trendingResponse = try decoder.decode(TrendingResponse.self, from: response.data)
                    self.trendingResponse = trendingResponse.trending ?? []
                    self.lastDate = trendingResponse.lastDate ?? ""
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
        return trendingResponse.count
    }
    
    func item(at indexPath: IndexPath) -> ProductCell.ViewState {
        let item = trendingResponse[indexPath.row]
        
        return .init(
            imageUrl: item.image,
            title: nil,
            description: item.description,
            currentPrice: item.currentPrice,
            originPrice: item.originPrice,
            percentOff: item.percentOff,
            rating: nil,
            descripFont: .regular(size: 12))
    }
}
