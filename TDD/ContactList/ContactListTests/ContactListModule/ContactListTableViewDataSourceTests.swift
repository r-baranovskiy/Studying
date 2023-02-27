import XCTest
@testable import ContactList

final class ContactListTableViewDataSourceTests: XCTestCase {
    
    var dataSource: ContactListTableViewDataSource!
    var mockTableView: MocktablewView!
    var contactListVC: ContactListViewController!
    var person: Person!

    override func setUpWithError() throws {
        dataSource = ContactListTableViewDataSource()
        dataSource.contactManager = ContactManager()
        
        mockTableView = MocktablewView.mockTableView(with: dataSource)
        person = Person(name: "Foo", phone: "Bar")
        
        contactListVC = ContactListViewController()
        contactListVC.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        dataSource = nil
        mockTableView = nil
        contactListVC = nil
        person = nil
    }
    
    func testHasOneSection() {
        let numberOfSections = mockTableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func testNumberOfRowsEqualsContactListCount() {
        dataSource.contactManager?.add(person: Person(name: "Foo", phone: "Bar"))
        XCTAssertEqual(mockTableView.numberOfRows(inSection: 0), 1)
        
        dataSource.contactManager?.add(person: Person(name: "Baz", phone: "Foo"))
        
        mockTableView.reloadData()
        
        XCTAssertEqual(mockTableView.numberOfRows(inSection: 0), 2)
    }
    
    func testCellForRowAtIndexPathReturnsContactCell() {
        dataSource.contactManager?.add(person: Person(name: "Foo", phone: "Bar"))
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is ContactListTableViewCell)
    }
    
    func testCellForRowCallsConfigureCell() {
        dataSource.contactManager?.add(person: person)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(
            row: 0, section: 0)) as! MockContactCell
        
        XCTAssertEqual(cell.person, person)
    }
    
    
}

// MARK: - Extensions ContactListTableViewDataSourceTests

extension ContactListTableViewDataSourceTests {
    class MocktablewView: UITableView {
        var cellIsDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        static func mockTableView(with dataSource: UITableViewDataSource) -> MocktablewView {
            let mockTableView = MocktablewView()
            mockTableView.dataSource = dataSource
            mockTableView.register(
                MockContactCell.self,
                forCellReuseIdentifier: MockContactCell.identifier)
            return mockTableView
        }
    }
    
    class MockContactCell: ContactListTableViewCell {
        var person: Person?
        
        override func configure(with person: Person) {
            self.person = person
        }
    }
}
