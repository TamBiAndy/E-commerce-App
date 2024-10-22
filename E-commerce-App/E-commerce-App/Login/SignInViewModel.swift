//
//  SignInViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 12/10/2024.
//

import Foundation
import Moya

struct LoginResponse: Codable {
    struct User: Codable {
        let id: String
        let userName: String
        let password: String
        let token: String
    }
    let status: Bool
    let message: String
    let user: User?
}

class SignInViewModel {
    
    let provider = MoyaProvider<APITarget>()

    
    func isValidPassword(password: String) throws -> Bool {
        
        guard !password.isEmpty else {
            throw ErrorLogin.passwordEmpty
        }
        
        guard password.count >= 8 else { // Kiểm tra độ dài mật khẩu
            throw ErrorLogin.atLeast8Char
        }

        let uppercaseLetter = CharacterSet.uppercaseLetters  // Kiểm tra chữ hoa
        guard password.rangeOfCharacter(from: uppercaseLetter) != nil else {
            throw ErrorLogin.atLeastOneUpperCaseLetter
        }
        
        let lowercaseLetter = CharacterSet.lowercaseLetters // Kiểm tra chữ thường
        guard password.rangeOfCharacter(from: lowercaseLetter) != nil else {
            throw ErrorLogin.atLeastOneLowerCaseLetter
        }

        let decimalDigit = CharacterSet.decimalDigits         // Kiểm tra số
        guard password.rangeOfCharacter(from: decimalDigit) != nil else {
            throw ErrorLogin.atLeastOneNumber
        }
        
        // Kiểm tra ký tự đặc biệt (nếu cần)
        let specialCharacterSet = CharacterSet(charactersIn: "!@#$%^&*(),.?\":{}|<>")
        guard password.rangeOfCharacter(from: specialCharacterSet) != nil else {
            throw ErrorLogin.atLeastOneSpecialChar
        }
        
        // Nếu mật khẩu đáp ứng tất cả điều kiện
        return true
    }
    
    func logIn(user: String, password: String, completion: @escaping (Bool) -> Void) throws {
        
        guard !user.isEmpty else {
            throw ErrorLogin.userNameEmpty
        }
        
        let isValidPassword = try isValidPassword(password: password)
        guard isValidPassword else { return }
        
        provider.request(.login(user: user, password: password)) { result in
            switch result {
            case .success(let response):
                do {
                    if (200...299).contains(response.statusCode) {
                
                        let decoder = JSONDecoder()
                        let loginResponse = try decoder.decode(LoginResponse.self, from: response.data)
                        SessionManager.shared.token = loginResponse.user?.token ?? ""
                        completion(true)
                        
                    } else {
                        completion(false)
                    }
                } catch {
                    print(error)
                    completion(false)
                }
                
            case .failure(_):
                completion(false)
            }
        }
    }
}
