//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/17.
//

import Fluent
import Vapor

final class Grade: Model, Content {
    static let schema = "grades"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Children(for: \.$grade)
    var students: [Student]
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
}
