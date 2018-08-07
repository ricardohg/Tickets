import PerfectLib
import PerfectHTTPServer
import PerfectHTTP

import StORM
import PostgresStORM

PostgresConnector.host = "localhost"
PostgresConnector.username = "tickets"
PostgresConnector.password = "password"
PostgresConnector.database = "ticketsdb"
PostgresConnector.port = 5432

let setupObj = Event()
try? setupObj.setup()

let server = HTTPServer()
server.serverPort = 8080

func events(request: HTTPRequest, response: HTTPResponse) {
    do {
        let getObj = Event()
        try getObj.findAll()
        
        var events: [[String: Any]] = []
        
        for row in getObj.rows() {
            events.append(row.asDictionary())
        }
        
        try response.setBody(json: events)
            .setHeader(.contentType, value: "Application/json")
            .completed()
        
    } catch  {
        response.setBody(string: "error handling the request")
            .completed(status: .internalServerError)
    }
}

var routes = Routes()
routes.add(method: .get, uri: "/events", handler: events)
server.addRoutes(routes)

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("network error throw : \(err) \(msg)")
}

