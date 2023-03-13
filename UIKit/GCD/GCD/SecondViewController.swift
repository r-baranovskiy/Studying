import UIKit

final class SecondViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .secondarySystemBackground
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 0, y: view.safeAreaInsets.bottom + 80,
                                 width: view.frame.width,
                                 height: view.frame.height / 2)
    }
}
