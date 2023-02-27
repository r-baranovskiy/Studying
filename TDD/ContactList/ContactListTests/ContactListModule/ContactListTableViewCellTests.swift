import XCTest
@testable import ContactList

final class ContactListTableViewCellTests: XCTestCase {
    
    var viewController: ContactListViewController!
    var tablewView: UITableView!

    override func setUpWithError() throws {
        viewController = ContactListViewController()
        viewController.loadViewIfNeeded()
        tablewView = viewController.tableView
    }

    override func tearDownWithError() throws {
        
    }
    
    func testCellHasTitleLabel() {
        
    }
}

extension ContactListTableViewCellTests: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
