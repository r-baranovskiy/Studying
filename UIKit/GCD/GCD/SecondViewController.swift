import UIKit

final class SecondViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .secondarySystemBackground
        return image
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return activity
    }()
    
    private var imageURL: URL?
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        imageView.addSubview(activityIndicator)
        fetchImage()
        delay(10) {
            self.showAlert()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 0, y: view.safeAreaInsets.bottom + 80,
                                 width: view.frame.width,
                                 height: view.frame.height / 2)
        activityIndicator.center = imageView.center
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Sign In", message: "Enter login and password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "LogIn", style: .cancel))
        
        alert.addTextField { tf in
            tf.placeholder = "Login"
        }
        
        alert.addTextField { tf in
            tf.placeholder = "Password"
            tf.isSecureTextEntry = true
        }
        
        present(alert, animated: true)
    }
    
    private func delay(_ delay: Int, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay), execute: {
            completion()
        })
    }
    
    private func fetchImage() {
        let url = "https://pm1.narvii.com/7269/4c01db2d79522a6e968e153603737bba27bdfa6cr1-1024-683v2_hq.jpg"
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        DispatchQueue.global(qos: .utility).async {
            guard let imageURL = URL(string: url),
                  let data = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}
