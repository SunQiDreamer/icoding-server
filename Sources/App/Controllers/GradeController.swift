//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/17.
//

import Vapor
import Fluent

struct GradeController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let grades = routes.grouped("grades")
        
        grades.post { req in
            let grade = try req.content.decode(Grade.self)
            try await grade.save(on: req.db)
            return grade
        }
        
        grades.get { req in
            let grades = try await Grade.query(on: req.db)
                .all()
            let getGrades = try grades.map { grade in
                try GetGrade(id: grade.requireID(), name: grade.name)
            }
            return getGrades
        }
    }
}
