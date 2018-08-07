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

let eventController = EventController()
server.addRoutes(Routes(eventController.routes))

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("network error throw : \(err) \(msg)")
}

