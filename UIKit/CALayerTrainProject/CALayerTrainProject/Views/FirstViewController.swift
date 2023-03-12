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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        viewModel = FirstViewViewModel()
        view.layer.insertSublayer(gradient, at: 0)
        view.addSubview(imageView)
        view.addSubview(tapButton)
        addConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        gradient.frame.size.width = view.bounds.width
        gradient.frame.size.height = view.safeAreaInsets.top + 50 + imageView.frame.size.height / 2
        layers()
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

