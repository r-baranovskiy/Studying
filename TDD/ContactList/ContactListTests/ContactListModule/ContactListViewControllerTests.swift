import XCTest
@testable import ContactList

final class ContactListViewControllerTests: XCTestCase {
    
     var sut: ContactListViewController!

    override func setUpWithError() throws {
        sut = ContactListViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testWhenViewIsLoadedTableViewIsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedDataSourceIsNotNil() {
        XCTAssertNotNil(sut.dataSource)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is ContactListTableViewDataSource)
    }
    
    
}
