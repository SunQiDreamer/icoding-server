//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/17.
//

import Fluent
import Vapor

final class Student: Model, Content {
    static let schema = "students"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "no")
    var no: Int
    
    @Parent(key: "grade_id")
    var grade: Grade
    
    @Siblings(through: StudentHobby.self, from: \.$student, to: \.$hobby)
    var hobbys: [Hobby]
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, name: String, no: Int, gradeId: UUID) {
        self.id = nil
        self.name = name
        self.no = no
        self.$grade.id = gradeId
    }
}
