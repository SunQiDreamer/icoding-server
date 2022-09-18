//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/17.
//

import Fluent
import Vapor

final class Hobby: Model, Content {
    static let schema = "hobbies"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Siblings(through: StudentHobby.self, from: \.$hobby, to: \.$student)
    var students: [Student]
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

}
