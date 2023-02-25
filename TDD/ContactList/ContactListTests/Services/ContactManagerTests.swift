import XCTest
@testable import ContactList

final class ContactManagerTests: XCTestCase {
    
    var contactManager: ContactManager!
    var person: Person!

    override func setUpWithError() throws {
        contactManager = ContactManager()
        person = Person(name: "Foo", phone: "Bar")
    }

    override func tearDownWithError() throws {
        contactManager = nil
        person = nil
    }
    
    func testInitContactManagerWithEmptyList() {
        XCTAssertEqual(contactManager.contactsCount, 0)
    }
    
    func testAddPersonIncrementContactListCount() {
        contactManager.add(person: person)
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
    
    func testContactAtIndexIsAddedPerson() {
        contactManager.add(person: person)
        let returnedPerson = contactManager.person(at: 0)
        
        XCTAssertEqual(person, returnedPerson)
    }
    
    func testAddingSameObjectDoesNotIncrementCount() {
        contactManager.add(person: Person(name: "Foo", phone: "Bar"))
        contactManager.add(person: Person(name: "Foo", phone: "Bar"))
        
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
    
}
