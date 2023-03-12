import UIKit

final class FirstViewController: UIViewController {
    
    private var viewModel: FirstViewViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel else { return }
            imageView.image = UIImage(named: viewModel.imageName)
            tapButton.setTitle(viewModel.buttonTitle, for: .normal)
        }
    }
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
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
    
    private let gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.colors = [
            UIColor.systemRed.cgColor, UIColor.systemGreen.cgColor,
            UIColor.systemBlue.cgColor
        ]
        //gradient.locations = [0, 0.2, 1]
        gradient.opacity = 1
        return gradient
    }()
    
    private let shapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 20
        layer.lineCap = CAShapeLayerLineCap(rawValue: "round")
        layer.fillColor = nil
        layer.strokeEnd = 1
        layer.strokeColor = UIColor.white.cgColor
        return layer
    }()
    
    private let overShapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 20
        layer.lineCap = CAShapeLayerLineCap(rawValue: "round")
        layer.fillColor = nil
        layer.strokeEnd = 0
        layer.opacity = 1
        layer.strokeColor = UIColor.blue.cgColor
        return layer
    }()
    
    private let animation: CABasicAnimation = {
        let animation = CABasicAnimation()
        animation.keyPath = "strokeEnd"
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.fillMode = .both
        animation.isRemovedOnCompletion = false
        return animation
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        animation.delegate = self
        view.backgroundColor = .systemBackground
        tapButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        viewModel = FirstViewViewModel()
        view.layer.insertSublayer(gradient, at: 0)
        view.layer.addSublayer(shapeLayer)
        view.layer.addSublayer(overShapeLayer)
        view.addSubview(imageView)
        view.addSubview(tapButton)
        addConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        layers()
        gradient.frame.size.width = view.bounds.width
        gradient.frame.size.height = view.safeAreaInsets.top + 50 + imageView.frame.size.height / 2
        configureShapeLayer(shapeLayer)
        configureShapeLayer(overShapeLayer)
    }
    
    @objc private func didTapButton() {
        overShapeLayer.add(animation, forKey: nil)
        overShapeLayer.strokeEnd += 0.2
    }
    
    private func configureShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.width / 2 - 100,
                              y: view.frame.height / 2))
        path.addLine(to: CGPoint(x: view.frame.width / 2 + 100,
                                 y: view.frame.height / 2))
        shapeLayer.path = path.cgPath
    }
    
    private func layers() {
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.systemRed.cgColor
        tapButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        tapButton.layer.shadowOpacity = 0.5
        tapButton.layer.cornerRadius = 5
    }
}

extension FirstViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let vc = UIViewController()
        vc.view.backgroundColor = .secondarySystemBackground
        
        if flag {
            present(vc, animated: true)
        }
    }
}

extension FirstViewController {
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(
                equalTo: view.widthAnchor, multiplier: 0.7),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
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

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let listVC = FirstViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListProvider.ContainerView>) -> FirstViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController: ListProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListProvider.ContainerView>) {
        }
    }
}

