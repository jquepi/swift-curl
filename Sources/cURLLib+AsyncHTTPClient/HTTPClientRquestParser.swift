//
//  File.swift
//  
//
//  Created by Federico on 10/12/20.
//

import AsyncHTTPClient
import NIOHTTP1
import cURLLib

public extension CURLCommand {
    
    convenience init(_ request: HTTPClient.Request ){
        let url = request.url.absoluteString
        
        let headers: [CURLOption] = Self.parseHeaders(request.headers)
        
        let options = headers
        self.init(url, options: options)
    }
    
    static func parseHeaders(_ headers: HTTPHeaders) -> [CURLOption]{
        headers.compactMap(CURLOption.header)
    }
    
}
