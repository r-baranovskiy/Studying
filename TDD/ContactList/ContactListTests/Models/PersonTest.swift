import XCTest
@testable import ContactList

final class PersonTest: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func testInitPersonWithNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar")
        XCTAssertNotNil(person, "peston must be not a nil")
    }
    
    func testInitPersonWithFullNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar", surname: "Baz")
        XCTAssertNotNil(person, "peston must be not a nil")
    }
}
