import UIKit

final class ViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hello"
        view.backgroundColor = .systemGreen
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        coordinator?.eventOccured(with: .buttonTapped)
    }
}

