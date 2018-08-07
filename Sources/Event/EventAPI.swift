import Foundation

// : Responsability: Convert to/from JSON, interact with Event class

class EventAPI {
    
    static func events() throws -> String {
        let getObj = Event()
        try getObj.findAll()
        
        var events: [[String: Any]] = []
        
        for row in getObj.rows() {
            events.append(row.asDictionary())
        }
        
        return try events.jsonEncodedString()
    }
    
}
