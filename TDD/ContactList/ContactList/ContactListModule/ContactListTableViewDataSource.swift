import UIKit

final class ContactListTableViewDataSource: NSObject {
    var contactManager: ContactManager?
}

extension ContactListTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactManager?.contactsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ContactListTableViewCell.identifier,
            for: indexPath) as? ContactListTableViewCell else {
            return UITableViewCell()
        }
        
        if let person = contactManager?.person(at: indexPath.row) {
            cell.configure(with: person)
        }
        
        return cell
    }
}
