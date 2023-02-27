import XCTest
@testable import ContactList

final class DetailViewControllerTests: XCTestCase {

    var detailVC: DetailViewController!
    
    override func setUpWithError() throws {
        detailVC = DetailViewController()
        detailVC.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        detailVC = nil
    }
    
    func testHasNameLabel() {
        XCTAssertNotNil(detailVC.nameLabel)
        XCTAssertTrue(detailVC.nameLabel.isDescendant(of: detailVC.view))
    }
    
    func testHasSurnamLabel() {
        XCTAssertNotNil(detailVC.surnameLabel)
        XCTAssertTrue(detailVC.surnameLabel.isDescendant(of: detailVC.view))
    }
    
    func testHasPhoneLabel() {
        XCTAssertNotNil(detailVC.phoneLabel)
        XCTAssertTrue(detailVC.phoneLabel.isDescendant(of: detailVC.view))
    }
    
    func testHasImage() {
        XCTAssertNotNil(detailVC.imageView)
        XCTAssertTrue(detailVC.imageView.isDescendant(of: detailVC.view))
    }
    
    func testSetValueToNameLabel() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.nameLabel.text, "Foo")
    }
    
    func testSetValueToSurnamLabel() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.surnameLabel.text, "Baz")
    }
    
    func testSetValueToPhoneLabel() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.phoneLabel.text, "Bar")
    }
    
    func testSetValueToImageView() {
        setupContactAndAppearanceTrancition()
        let imageData = UIImage(systemName: "person")?.pngData()
        XCTAssertEqual(detailVC.person.imageData, imageData)
    }
    
    func setupContactAndAppearanceTrancition() {
        let image = UIImage(systemName: "person")
        let imageData = image?.pngData()
        let person = Person(name: "Foo", phone: "Bar",
                            surname: "Baz", imageData: imageData)
        
        detailVC.person = person
        
        detailVC.beginAppearanceTransition(true, animated: true)
        detailVC.endAppearanceTransition()
    }
}
