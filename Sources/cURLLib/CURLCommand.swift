public class CURLCommand{
    final let prefix = "curl"
    
    public var options: [CURLOption] = []
    public let url: String
    
    public var cURLString: String {
        let optionStrings = options.map{ $0.toCommand() }
        return prefix + " " + optionStrings.joined(separator: "") + "" + url
    }
    
    public init(_ url: String, options: [CURLOption]){
        self.options = options
        self.url = url
    }
    
    // TODO: Consider use of builder pattern
    //    public func basic() -> Self {
    //        self.options.append(.basic)
    //        return self
    //    }
    
}
