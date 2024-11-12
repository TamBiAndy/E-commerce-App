

import UIKit
import Moya

struct ShopBageResponse: Codable {
  struct ShoppingBag: Codable {
    let id: String?
    let image: String?
    let productName: String?
    let descriptions: String?
    let size: Int?
    let qty: Int?
    let deliveryDate: String?
    let orderAmount: Int?
    let orderTotal: Int?
  }

  let id: String?
  let shoppingBag: ShoppingBag?
}

class ShopBagViewModel {
    let provider = MoyaProvider<APITargetHomeVC>(stubClosure: MoyaProvider.delayedStub(2))
    
    var shopBag: ShopBageResponse.ShoppingBag?
    
    var productId: String?
    
    init(productId: String? = nil) {
        self.productId = productId
    }
    
    func getData(completion: @escaping (Error?) -> Void) {
        if let productId = productId {
            provider.request(.getShoppingBag(id: productId)) { result in
                switch result {
                case .success(let response):
                    let decoder = JSONDecoder()
                    do {
                        let shopBagResponse = try decoder.decode(ShopBageResponse.self, from: response.data)
                        self.shopBag = shopBagResponse.shoppingBag
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
}
