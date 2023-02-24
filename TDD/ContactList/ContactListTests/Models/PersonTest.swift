import XCTest
@testable import ContactList

final class PersonTest: XCTestCase {
    
    var image: UIImage?
    var imageData: Data?

    override func setUpWithError() throws {
        image = #imageLiteral(resourceName: "mockImage")
        imageData = image?.pngData()
    }

    override func tearDownWithError() throws {
        image = nil
        imageData = nil
    }
    
    func testInitPersonWithNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar")
        XCTAssertNotNil(person, "peston must be not a nil")
    }
    
    func testInitPersonWithFullNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar", surname: "Baz")
        XCTAssertNotNil(person, "peston must be not a nil")
    }
    
    func testWhenGivenNameAndPhoneSetNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar")
        XCTAssertEqual(person.name, "Foo")
        XCTAssertEqual(person.phone, "Bar")
    }
    
    func testWhenGivenSurnameSetsSurname() {
        let person = Person(name: "Foo", phone: "Bar", surname: "Bar")
        XCTAssertTrue(person.surname == "Bar")
    }
    
    func testInitPersonWithDate() {
        let person = Person(name: "Foo", phone: "Bar")
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithFullNameAndDate() {
        let person = Person(name: "Foo", phone: "Bar", surname: "Baz")
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithImage() {
        let image = #imageLiteral(resourceName: "mockImage")
        let imageData = image.pngData()
        let person = Person(name: "Foo", phone: "Bar", imageData: imageData)
        
        XCTAssertNotNil(person.imageData)
    }
    
    func testInitPersonWithFullNameAndImage() {
        let person = Person(name: "Foo", phone: "Bar", surname: "Baz", imageData: imageData)
        
        XCTAssertNotNil(person.imageData)
    }
}
