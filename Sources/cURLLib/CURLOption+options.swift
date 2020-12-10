//
//  CURLOption.swift
//  
//
//  Created by Federico on 10/12/20.
//

public extension CURLOption {
    
    /// Use HTTP Basic Authentication.
    ///
    /// This is the default and this option is usually pointless, unless you use it to override a previously set option that sets a different authentication method
    static let basic = CURLOption("basic")
    
    /// HTTP POST data
    /// - Parameter data: Body of request
    /// - Returns: The option object
    static func data(data: String) -> CURLOption {
        CURLOption("data", input: data)
    }
    
    /// Pass custom header to server
    /// - Parameters:
    ///   - key: Header name
    ///   - value: Header value
    /// - Returns: The option object
    static func header(key: String, value: String) -> CURLOption {
        CURLOption("header", input: "\(key):\(value)")
    }
    
    /// Use HTTP 1.0
    static let http1_0 = CURLOption("http1.0")
    
    /// Use HTTP 1.1
    static let http1_1 = CURLOption("http1.1")
    
    /// Use HTTP 2
    static let http2 = CURLOption("http2")
    
    /// CA certificate to verify peer against
    /// - Parameter path:CA certificate path
    /// - Returns: The option object
    static func caCert(file path: String) -> CURLOption {
        CURLOption("cacert", input: path)
    }
    
    /// Maximum time allowed for connection.
    ///
    /// This only limits the connection phase, once curl has connected this option is of no more use. See also the `--max-time` option.
    /// If this option is used several times, the last one will be used.
    /// - Parameter seconds: Maximum time in seconds that you allow the connection to the server to take.
    /// - Returns: The option object
    static func connectTimeout(seconds: Int) -> CURLOption {
        CURLOption("connect-timout", input: String(seconds))
    }
    
    /// Specify request command to use
    ///
    /// Note that the data is sent exactly as specified with no extra processing (with all newlines cut off).
    /// *The data is expected to be &zerosp;"url-encoded"*. This will cause curl to pass the data to the server using the content-type application/x-www-form-urlencoded.
    ///
    /// If this option is used more than once on the same command line, the data pieces specified will be merged together with a separating &-letter.
    /// Thus, using `'-d name=daniel -d skill=lousy'` would generate a post chunk that looks like `&zerosp;'name=daniel&skill=lousy'`.
    ///
    /// If you start the data with the letter @, the rest should be a file name to read the data from, or - if you want curl to read the data from stdin.
    /// The contents of the file must already be url-encoded. Multiple files can also be specified.
    ///
    /// Posting data from a file named 'foobar' would thus be done with `--data @foobar`"
    /// - Parameter command: The request method to use.
    /// - Returns: The option object
    static func request(command: String) -> CURLOption {
        CURLOption("request", input: command)
    }
    
    /// Make the operation more talkative
    ///
    /// Mostly usable for debugging. Lines starting with `>` means data sent by curl,
    /// `<` means data received by curl that is hidden in normal cases and lines starting with `*` means additional info provided by curl
    ///
    /// If this option is used twice, the second will again disable verbose.
    static let verbose = CURLOption("verbose")
    
}
