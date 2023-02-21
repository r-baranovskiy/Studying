import UIKit
import Spring

class ViewController: UIViewController {
    
    // MARK: - Constraints
    
    private let animateView: SpringView = {
        let view = SpringView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let animateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Run Core Animation", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addConstraints()
        addTargets()
    }
    
    // MARK: - Behaviour
    
    private func addTargets() {
        animateButton.addTarget(
            self, action: #selector(coreAnimateButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func coreAnimateButtonDidTap(_ sender: UIButton) {
        sender.pulsate(with: 10)
        
        animateView.animation = "wobble"
        animateView.curve = "easeIn"
        animateView.force = 2
        animateView.duration = 1
        animateView.delay = 0.5
        animateView.animate()
    }
    
    // MARK: - Layer
    
    // MARK: - Animation
    
    private func setAnimation(with view: UIView) {
        UIView.animate(withDuration: 0.6, delay: 0, options: [.autoreverse, .repeat]) {
            view.frame.origin.x -= 40
        }
    }
}

// MARK: - Constraints

extension ViewController {
    private func addConstraints() {
        view.addSubview(animateView)
        view.addSubview(animateButton)
        
        NSLayoutConstraint.activate([
            animateView.heightAnchor.constraint(equalToConstant: 200),
            animateView.widthAnchor.constraint(
                equalTo: view.widthAnchor, multiplier: 0.8),
            animateView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            animateView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            animateButton.widthAnchor.constraint(equalTo: animateView.widthAnchor),
            animateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animateButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
}

