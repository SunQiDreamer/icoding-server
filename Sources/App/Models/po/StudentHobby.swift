//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/17.
//

import Fluent
import Vapor

final class StudentHobby: Model {
    static let schema = "student+tag"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "student_id")
    var student: Student
    
    @Parent(key: "hobby_id")
    var hobby: Hobby
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
//    init() {}
//
//    init(id: UUID? = nil, student: Student, hobby: Hobby) throws {
//          self.id = id
//          self.$student.id = try student.requireID()
//          self.$hobby.id = try hobby.requireID()
//      }
}

