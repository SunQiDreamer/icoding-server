//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/17.
//

import Fluent

struct CreateHobby: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Hobby.schema)
            .id()
            .field("name", .string, .required)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .unique(on: "name")
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema(Hobby.schema).delete()
    }
}
