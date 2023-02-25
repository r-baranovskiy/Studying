import XCTest
@testable import ContactList

final class ContactListTableViewDataSourceTests: XCTestCase {
    


    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func testHasOneSection() {
        let dataSource = ContactListTableViewDataSource()
        let taleView = UITableView()
        taleView.dataSource = dataSource
        
        let numberOfSections = taleView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func testNumberOfRowsEqualsContactListCount() {
        let dataSource = ContactListTableViewDataSource()
        dataSource.contactManager = ContactManager()
        let taleView = UITableView()
        taleView.dataSource = dataSource

        dataSource.contactManager?.add(person: Person(name: "Foo", phone: "Bar"))
        XCTAssertEqual(taleView.numberOfRows(inSection: 0), 1)
        
        dataSource.contactManager?.add(person: Person(name: "Baz", phone: "Foo"))
        
        taleView.reloadData()
        
        XCTAssertEqual(taleView.numberOfRows(inSection: 0), 2)
        
    }
}
