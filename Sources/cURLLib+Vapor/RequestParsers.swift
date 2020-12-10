//
//  File.swift
//
//
//  Created by Federico on 10/12/20.
//

import cURLLib
import Vapor

extension HTTPVersion: Hashable{
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.major)
        hasher.combine(self.minor)
    }
}

public extension CURLCommand {
    
    static let versionMap: [HTTPVersion:CURLOption] = [
        .init(major: 1, minor: 0) : .http1_0,
        .init(major: 1, minor: 1) : .http1_1,
        .init(major: 2, minor: 0) : .http2,
    ]
    
    convenience init(_ request: Request){
        let url = request.url.string
        
        var options: [CURLOption] = [.verbose]
        options.append(.request(command: request.method.rawValue))
        options.append(Self.versionMap[request.version] ?? .http1_0)
        options.append(contentsOf: Self.parseHeaders(request.headers))
        
        if let body = request.body.data,
           let content = body.getString(at: 0, length: body.readableBytes){
            var escapedContent = content.debugDescription
            escapedContent.removeFirst()
            escapedContent.removeLast()
            options.append(.data(data: escapedContent))
        }
        
        self.init(url, options: options)
    }
    
    static func parseHeaders(_ headers: HTTPHeaders) -> [CURLOption]{
        headers.compactMap(CURLOption.header)
    }
    
}

extension Request {
    var cURL: CURLCommand {
        CURLCommand(self)
    }
}
