//: [Previous](@previous)

import Foundation

enum errorCodes:Double {
    case unknown = 0
    case network = 1
    case server = 2
}

enum errorTypes:String,ErrorType {
    case fatal = "fatalError"
    case major = "majorError"
    case minor = "minor"
}

struct Error {
    
    var errorType:errorTypes!
    var errorCode:errorCodes!
    var errorStatus:Bool!
    
    func newError() {
        
        defer {logError}
        
        guard errorCode != .unknown else {return}
        //do some stuff with errorCode
        
        guard errorStatus == false else {return}
        //do some stuff with errorStatus
        
        guard errorType != .minor else {return}
        //do some stuff with erorrType
    }
    
    private func logError() {
        
    }
    
    func download() throws -> Bool {
        
        //if server is down
        throw errorTypes.fatal
        
        //if network is not available
        throw errorTypes.major
        
        //if server don't return data
        throw errorTypes.minor
        
        return true
    }
    
    func update() -> Bool {
        do {
            let resultData = try download()
            return resultData
        }
        catch errorTypes.fatal {
            // Deal with badness.
        }
        catch errorTypes.major {
            // Deal with worseness.
        }
        catch errorTypes.minor {
            // Deal with terribleness.
        }
        catch {
            // Unkown Errors
        }
    }
}

//: [Next](@next)