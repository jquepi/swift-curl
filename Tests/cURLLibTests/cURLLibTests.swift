import XCTest
@testable import cURLLib
@testable import cURLLib_Vapor

import XCTVapor
import Vapor

final class cURLLibTests: XCTestCase {
    
    var app: Application!
    
    override func setUpWithError() throws {
        var env = try Environment.detect()
        try LoggingSystem.bootstrap(from: &env)
        self.app = Application(.testing)
        self.app.http.server.configuration.hostname = "testing.app.com"
        self.app.middleware.use(CURLDebugMiddleware())
    }
    
    override func tearDown() {
        self.app.shutdown()
    }
    
    struct TestPayload: Codable{
        let aString: String
        let aNumber: Double
    }
    func test() throws{
        app.post(["test_post"]){ req -> String in
            let curl = req.cURL
            let curlString = curl.cURLString
           // print(curlString)
            return curlString
        }
        let payload = TestPayload(aString: "Ciao a tutti", aNumber: 23.9)
        let payloadData = try JSONEncoder().encode(payload)
        
        try app.test(.POST, "/test_post", body: .init(data: payloadData))
    }

    static var allTests = [
        ("testExample", test),
    ]
}
