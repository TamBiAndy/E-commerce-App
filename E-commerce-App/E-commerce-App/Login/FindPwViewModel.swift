//
//  FindPwViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 14/10/2024.
//

import UIKit
import Moya

struct SuccessResponse: Codable {
    let status: String?
    let message: String?
    let data: VerificationData?
}

struct VerificationData: Codable {
    let userName: String?
    let email: String?
    let verificationCode: String?
    let verificationExpiry: String?
}

struct ErrorResponse: Codable, Error {
    let status: String?
    let message: String?
    let errorCode: String?
}

enum APIError: Error {
    case userNameEmpty
    case userNotFound        // Khi API trả về rằng người dùng không tồn tại
    case serverError         // Lỗi từ máy chủ
    case decodingError       // Lỗi khi phân tích JSON
    case unknownError
    case apiError(ErrorResponse)
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .userNameEmpty:
            return "User not empty"
        case .apiError(let response):
            return response.message
        case .userNotFound:
            return "Tên người dùng không tồn tại"
        case .serverError, .decodingError, .unknownError:
            return "Lỗi hệ thống từ máy chủ"
        }
    }
}


class FindPwViewModel {
    
    let provider = MoyaProvider<APITarget>(stubClosure: MoyaProvider.delayedStub(2))
    
    func submit(userName: String, completion: @escaping (Result<SuccessResponse, APIError>) -> Void) throws {
        guard !userName.isEmpty else { throw APIError.userNameEmpty }
        
        provider.request(.forgotPassword(email: userName), completion: { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
//                    let apiResponse = try decoder.decode(APIResponse.self, from: response.data)
                    switch response.statusCode {
                    case 200...299:
                        let apiResponse = try decoder.decode(SuccessResponse.self, from: response.data)
                        completion(.success(apiResponse))
                    case 404:
                        let apiResponse = try decoder.decode(ErrorResponse.self, from: response.data)
                        completion(.failure(.apiError(apiResponse)))
                        print("user not found")
                    case 500:
                        completion(.failure(APIError.serverError))
                    default:
                        completion(.failure(APIError.unknownError))
                    }
                } catch {
                    completion(.failure(APIError.decodingError))
                }
                
            case .failure(let error):
                completion(.failure(APIError.serverError))
            }
        })
    }
    func createAttributeString(for string: String, color1: UIColor, color2: UIColor) -> NSAttributedString {
        var characters = string.components(separatedBy: " ")
        let firstString = characters.removeFirst()
        let lastString = characters.joined(separator: " ")
        let attribute = NSMutableAttributedString(string: firstString, attributes: [
            NSAttributedString.Key.foregroundColor: color1,
            NSAttributedString.Key.font: UIFont.regular(size: 12)
        ])
        
        attribute.append(NSAttributedString(string: " " + lastString, attributes: [
            NSAttributedString.Key.foregroundColor: color2,
            NSAttributedString.Key.font: UIFont.regular(size: 12)
        ]))
        
        return attribute
    }
}
