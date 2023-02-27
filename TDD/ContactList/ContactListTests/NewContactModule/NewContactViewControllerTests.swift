import XCTest
@testable import ContactList

final class NewContactViewControllerTests: XCTestCase {

    var sut: NewContactViewController!
    
    override func setUpWithError() throws {
        sut = NewContactViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testHasNameTextField() {
        XCTAssertTrue(sut.nameTextField.isDescendant(of: sut.view))
    }
    
    func testHasSurnameTextField() {
        XCTAssertTrue(sut.surnameTextField.isDescendant(of: sut.view))
    }
    
    func testHasPhoneTextField() {
        XCTAssertTrue(sut.phoneTextField.isDescendant(of: sut.view))
    }
    
    func testHasSaveButton() {
        XCTAssertTrue(sut.saveButton.isDescendant(of: sut.view))
    }
    
    func testSaveNewContact() {
        sut.nameTextField.text = "Foo"
        sut.surnameTextField.text = "Bar"
        sut.phoneTextField.text = "Baz"
        
        sut.contactManager = ContactManager()
        sut.saveButtonDidTap()
        
        let contact = sut.contactManager.person(at: 0)
        let imageData = UIImage(systemName: "person")?.pngData()
        
        let person = Person(name: "Foo", phone: "Baz",
                            surname: "Bar", imageData: imageData)
        
        
        XCTAssertEqual(contact, person)
    }
    
    func testButtonHasSaveMethod() {
        let saveButton = sut.saveButton
        guard let actions = saveButton.actions(
            forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail(); return
        }
        
        XCTAssertTrue(actions.contains("saveButtonDidTap"))
    }
}
