import UIKit

class CarShopViewController: UIViewController {
    
    private let shopCollectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .brown
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        addConstraints()
    }
    
    private func setUpView() {
        view.backgroundColor = .systemBackground
        view.addSubview(shopCollectionView)
    }
}

// MARK: - Constraints

extension CarShopViewController {
    private func addConstraints() {
        NSLayoutConstraint.activate([
            shopCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            shopCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            shopCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shopCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
