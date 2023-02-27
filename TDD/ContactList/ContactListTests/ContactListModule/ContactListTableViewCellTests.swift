import XCTest
@testable import ContactList

final class ContactListTableViewCellTests: XCTestCase {
    
    var viewController: ContactListViewController!
    var tablewView: UITableView!
    var cell: ContactListTableViewCell!

    override func setUpWithError() throws {
        viewController = ContactListViewController()
        viewController.loadViewIfNeeded()
        tablewView = viewController.tableView
        
        cell = tablewView.dequeueReusableCell(
            withIdentifier: ContactListTableViewCell.identifier,
            for: IndexPath(row: 0, section: 0)) as? ContactListTableViewCell
    }

    override func tearDownWithError() throws {
        cell = nil
    }
    
    func testCellHasTitleLabel() {
        XCTAssertNotNil(cell.nameLabel)
    }
    
    func testCellHasNameLabelInContentView() {
        XCTAssertTrue(cell.nameLabel.isDescendant(of: cell.contentView ))
    }
    
    func testConfigureSetName() {
        let person = Person(name: "Foo", phone: "Bar")
        cell.configure(with: person)
        XCTAssertEqual(cell.nameLabel.text, person.name)
    }
}

extension ContactListTableViewCellTests {
    class MockTableViewDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
