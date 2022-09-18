//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/17.
//

import Vapor

enum MyError {
    case userNotLoggedIn
    case invalidEmail(String)
}

extension MyError: AbortError {
    var status: NIOHTTP1.HTTPResponseStatus {
        switch self {
        case .userNotLoggedIn:
            return .unauthorized
        case .invalidEmail:
            return .badRequest
        }
    }
    
    var reason: String {
        switch self {
        case .userNotLoggedIn:
            return "没有登录"
        case .invalidEmail(let email):
            return "邮箱无效 \(email)"
        }
    }
    
 
}
