//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/17.
//

import Vapor
import Fluent

struct StudentController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let students = routes.grouped("students")
        
        students.post() { req in
            let studentVo = try req.content.decode(StudentVo.self)
            
            let student = Student(name: studentVo.name, no: studentVo.no, gradeId: UUID(uuidString: studentVo.gradeId)!)
            
            try await student.create(on: req.db)
            return student
        }
    }

}
