import StORM
import PostgresStORM

class Event: PostgresStORM {
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var price: Double = 0
    
    override func table() -> String {
        return "events"
    }
    
}
