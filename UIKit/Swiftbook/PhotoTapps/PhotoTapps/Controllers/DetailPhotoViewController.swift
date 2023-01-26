import UIKit

final class DetailPhotoViewController: UIViewController {
    
    var image: UIImage?
    
    private let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 7
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .label
        button.setTitle(" Tap to share", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addTarget(DetailPhotoViewController.self,
                         action: #selector(shareButtonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(detailImageView)
        view.addSubview(shareButton)
        detailImageView.image = image
        setUpConstraints()
    }
    
    @objc private func shareButtonPressed() {
        
    }
    
    // MARK: - Constraints
    
    private func setUpConstraints() {
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            detailImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            detailImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            shareButton.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 50),
            shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareButton.heightAnchor.constraint(equalToConstant: 40),
            shareButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
