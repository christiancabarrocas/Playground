//: [Previous](@previous)

import Foundation

//BEFORE

class TalentAPIClient {
    
    let endpoint = "endpoint"
    
    func fetch(completion: (jsonData:[NSDictionary]) -> Void) {
        
        guard let URL = NSURL(string: endpoint) else {return}
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(URL) {(data, response, error) -> Void in
            
            guard error == nil && data != nil else {
                print("Failed data download")
                return
            }
            
            do {
                if case let dictionaries as [NSDictionary] = try NSJSONSerialization.JSONObjectWithData(data!, options: []) {
                    completion(jsonData: dictionaries)
                }
            } catch {
                print("Unexpected data format from server")
            }
        }

        task.resume()
    }
}


//AFTER

class TalentAPIClientRefactor {
    
    let endpoint = "endpoint"
    var completion: ((jsonData: [NSDictionary]) -> Void)?
    
    func fetch(completion: (jsonData:[NSDictionary]) -> Void) {
        
        guard let URL = NSURL(string: endpoint) else {return}
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(URL, completionHandler: parseServerData)
        
        task.resume()
    }
    
    func parseServerData(data: NSData?, response: NSURLResponse?, error:NSError?) {
        
        guard error == nil else {
            print("Unable to connect to server")
            return
        }
        
        guard let data = data else {
            print("Failed to download data from server")
            return
        }
        
        do {
            let dictionaries = try parseJSONData(data, options: []) as! [NSDictionary]
                completion?(jsonData: dictionaries)
        }catch {
            print("Unexpected data format")
        }
    }
    
    func parseJSONData(data: NSData, options opt: NSJSONReadingOptions) throws -> AnyObject {
        return try NSJSONSerialization.JSONObjectWithData(data, options: opt)
    }
}

//: [Next](@next)