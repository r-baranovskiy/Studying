import Foundation

struct Person {
    var name: String
    var phone: String
    var surname: String?
    
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
    
    init(name: String, phone: String, surname: String) {
        self.name = name
        self.phone = phone
        self.surname = surname
    }
}
