import Foundation

struct Person {
    var name: String
    var phone: String
    var surname: String?
    var imageData: Data?
    private (set) var date: Date?
    
    init(name: String, phone: String, imageData: Data? = nil) {
        self.name = name
        self.phone = phone
        date = Date()
        self.imageData = imageData
    }
    
    init(name: String, phone: String, surname: String, imageData: Data? = nil) {
        self.name = name
        self.phone = phone
        self.surname = surname
        date = Date()
        self.imageData = imageData
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.phone == rhs.phone
    }
}
