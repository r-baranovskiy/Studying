import UIKit

class OrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        
    }

    private func configureNavBar() {
        view.backgroundColor = .systemBackground
        title = "Order"
    }
}
