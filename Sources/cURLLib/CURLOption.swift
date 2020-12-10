import Foundation

/// Describe an option
public struct CURLOption{
    public let option: String
    public let input: String
    
    func toCommand() -> String {
        var commandString = "--\(option) "
        if !input.isEmpty {
            commandString = commandString + "\"\(input)\" "
        }
        return commandString
    }
    
    init(_ option: String, input: String = ""){
        self.option = option
        self.input = input
    }
}
