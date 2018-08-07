import StORM
import PostgresStORM

class Event: PostgresStORM {
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var price: Float = 0
    var imageurl: String = ""
    
    override func table() -> String {
        return "events"
    }
    
    override func to(_ this: StORMRow) {
        id = this.data["id"] as? Int ?? 0
        name = this.data["name"] as? String ?? ""
        description = this.data["description"] as? String ?? ""
        price = this.data["price"] as? Float ?? 0
        imageurl = this.data["imageurl"] as? String ?? ""
    }
    
    func rows() -> [Event] {
        return self.results.rows.map { acronym in
            
            let row = Event()
            
            row.to(acronym)
            
            return row
            
        }
    }
    
    func asDictionary() -> [String: Any] {
        return [
            "id": id,
            "name": name,
            "description": description,
            "price": price,
            "imageurl": imageurl
        ]
    }
}
