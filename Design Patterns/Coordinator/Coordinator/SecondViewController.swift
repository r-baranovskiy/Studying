import UIKit

final class SecondViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Second"
    }
}
