import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

//Responsability: Call appropiate func, deal with request/response, exception handling

final class EventController {
    
    var routes: [Route] {
        return [
            Route(method: .get, uri: "/events", handler: events)
        ]
    }
    
    private func events(request: HTTPRequest, response: HTTPResponse) {
        do {
            
            let jsonString = try EventAPI.events()
            
            response.setBody(string: jsonString)
                .setHeader(.contentType, value: "Application/json")
                .completed()
            
        } catch  {
            response.setBody(string: "error handling the request")
                .completed(status: .internalServerError)
        }
    }
    
    
}
