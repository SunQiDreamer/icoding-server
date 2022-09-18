//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/17.
//

import Fluent

struct CreateStudentHobby: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(StudentHobby.schema)
            .id()
            .field("student_id", .uuid)
            .field("hobby_id", .uuid)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .unique(on: "student_id", "hobby_id")
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(StudentHobby.schema).delete()
    }
}
