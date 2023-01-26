import Foundation

class Notifications {
    
    static let notific = Notification.Name("The image is'n selected")
    
    func allawNotification(observer: Any, selector: Selector, rawValue: String) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: Notification.Name(rawValue), object: nil)
    }
    
    func showNotification() {
    }
    
}
