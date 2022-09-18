//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/17.
//

import Vapor
import Fluent

struct HobbyController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let hobbies = routes.grouped("hobbies")
        
        hobbies.post { req in
            let hobbyVo = try req.content.decode(HobbyVo.self)
            let hobby = Hobby()
            hobby.name = hobbyVo.name
            
            try await hobby.save(on: req.db)
            return hobby
        }
    }
}
