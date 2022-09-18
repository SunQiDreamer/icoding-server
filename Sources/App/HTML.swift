//
//  File.swift
//  
//
//  Created by 孙琦 on 2022/9/17.
//

import Vapor

struct HTML {
    let value: String
}

extension HTML: ResponseEncodable {
    func encodeResponse(for request: Request) -> EventLoopFuture<Response> {
        var headers = HTTPHeaders()
        headers.add(name: .contentType, value: "text/html")
        return request.eventLoop.makeSucceededFuture(.init(status: .ok, version: .http1_1, headersNoUpdate: headers, body: .init(string: value)))
    }
}
