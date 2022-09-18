//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/17.
//

import Fluent

struct CreateStudent: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Student.schema)
            .id()
            .field("name", .string, .required)
            .field("no", .int, .required)
            .field("grade_id", .uuid, .required)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .unique(on: "no")
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema(Student.schema).delete()
    }
}
