//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/18.
//

import Vapor

final class HobbyVo: Content {
    var name: String
    
    var studentIds: [String]?
}

extension HobbyVo: Validatable {
    static func validations(_ validations: inout Validations) {
        
        validations.add("name", as: String.self, is: !.empty)
        validations.add("studentIds", as: [String].self)
    }
}
