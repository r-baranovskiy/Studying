import UIKit

class ViewController: UIViewController {
    
    private let showSecondVCButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 40)
        button.setTitle("Open SecondVC", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(showSecondVCButton)
        showSecondVCButton.addTarget(
            self, action: #selector(didTapButton), for: .touchUpInside)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        showSecondVCButton.center = view.center
    }
    
    @objc private func didTapButton() {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

