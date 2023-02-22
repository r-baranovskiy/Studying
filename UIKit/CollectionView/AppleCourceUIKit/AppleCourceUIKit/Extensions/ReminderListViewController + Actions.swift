import UIKit

extension ReminderListViewController {
    @objc func doneButtonDidTap(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
