//
//  cURLDebugMiddleware.swift
//  
//
//  Created by Federico Giuntoli on 10/12/20.
//

import Vapor

public class CURLDebugMiddleware: Middleware{
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        let urlString = request.cURL.cURLString
        let message = Logger.Message(stringLiteral: urlString)
        request.logger.debug(message)
        return next.respond(to: request)
    }
}
