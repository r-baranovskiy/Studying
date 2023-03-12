import UIKit

final class SecondViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tapButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(tapButton)
        addConstraints()
    }
}

extension SecondViewController {
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(
                equalTo: view.widthAnchor, multiplier: 0.7),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            tapButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            tapButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            tapButton.widthAnchor.constraint(
                equalTo: view.widthAnchor, multiplier: 0.3),
            tapButton.heightAnchor.constraint(
                equalTo: tapButton.widthAnchor, multiplier: 0.5)
        ])
    }
}
