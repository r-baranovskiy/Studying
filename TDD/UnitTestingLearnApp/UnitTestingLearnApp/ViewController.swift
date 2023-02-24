import UIKit

class ViewController: UIViewController {
    
    var value = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(with: -1)
    }
    
    func setValue(with value: Int) {
        self.value = min(max(value, 0), 100)
        print(value)
    }
}

