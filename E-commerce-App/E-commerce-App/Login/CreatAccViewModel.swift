//
//  CreatAccViewModel.swift
//  E-commerce-App
//
//  Created by Andy on 14/10/2024.
//

import Foundation
import Moya

enum ErrorLogin: Error {
    case passwordEmpty
    case atLeast8Char
    case atLeastOneUpperCaseLetter
    case atLeastOneLowerCaseLetter
    case atLeastOneNumber
    case atLeastOneSpecialChar
    case notMatchingPassword
    case userNameEmpty
}

extension ErrorLogin: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .passwordEmpty:
            return "Password is not empty"
        case .atLeast8Char, .atLeastOneNumber, .atLeastOneSpecialChar, .atLeastOneLowerCaseLetter, .atLeastOneUpperCaseLetter:
            return "Password must be at least 8 characters, uppercase, lowercase, number and special character"
        case .notMatchingPassword:
            return "Password is not matching"
        case .userNameEmpty:
            return "Username is not Empty"
        }
    }
}

struct CreateAccountResponse: Codable {
    struct User: Codable {
        let id: String
        let username: String
        let password: String
        let confirmPassword: String
    }
    let status: Bool
    let message: String
    let user: User?
}

class CreatAccViewModel {
    let provider = MoyaProvider<APITarget>(stubClosure: MoyaProvider.delayedStub(2))
    
    func isValidPassword(password: String) throws -> Bool {
        guard !password.isEmpty else { // check empty
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
    
    func checkMatchingPassword(password1: String, password2: String) throws -> Bool {
        guard password1 == password2 else {
            throw ErrorLogin.notMatchingPassword }
        return true
    }
    
    func creatAccount(userName: String, password1: String, password2: String, completion: @escaping (Bool) -> Void) throws {
        
        guard !userName.isEmpty else {
            throw ErrorLogin.userNameEmpty
        }
        
        let isMatching = try checkMatchingPassword(password1: password1, password2: password2)
        
        let pass1IsValid = try isValidPassword(password: password1)
        let pass2IsValid = try isValidPassword(password: password2)
        
        
        guard isMatching, pass1IsValid, pass2IsValid else { return }
        
        // call API
        
        provider.request(.creatAcc(user: userName, password: password1, confirmPw: password2)) { result in
            switch result {
            case .success(let response):
                
                do {
                    if (200...299).contains(response.statusCode) {
                        let decoder = JSONDecoder()
                        
                        let creatAccResponse = try decoder.decode(CreateAccountResponse.self, from: response.data)
                        completion(true)
                        
                    } else {
                        completion(false)
                    }
                } catch {
                    completion(false)
                }
            case .failure(_):
                completion(false)
            }
        }
    }
}
