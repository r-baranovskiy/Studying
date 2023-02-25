import Foundation

final class ContactManager {
    
    var contactsCount: Int {
        return persons.count
    }
    
    private var persons: [Person] = []
 
    func add(person: Person) {
        if !persons.contains(person) {
            persons.append(person)
        }
    }
    
    func person(at index: Int) -> Person {
        return persons[index]
    }
}
