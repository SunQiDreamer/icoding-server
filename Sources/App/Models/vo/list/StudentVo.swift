//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/18.
//

import Vapor

final class StudentVo: Content {
    
    var name: String
    
    var no: Int
    
    var gradeId: String
    
    var hobbyIds: [String]? = []
}

extension StudentVo: Validatable {
    static func validations(_ validations: inout Validations) {
        
        validations.add("name", as: String.self, is: !.empty)
        validations.add("no", as: Int.self, required: true)
        validations.add("gradeId", as: String.self, required: true)
        validations.add("hobbyIds", as: [String].self)
    }
}
