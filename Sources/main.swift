import PerfectLib
import PerfectHTTPServer
import PerfectHTTP

let server = HTTPServer()
server.serverPort = 8080

var routes = Routes()
server.addRoutes(routes)

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("network error throw : \(err) \(msg)")
}

