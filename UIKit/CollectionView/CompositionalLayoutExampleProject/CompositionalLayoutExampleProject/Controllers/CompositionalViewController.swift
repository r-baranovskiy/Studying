import UIKit

final class CompositionalViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Make an order", for: .normal)
        button.backgroundColor = .systemRed
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        addConstraints()
    }
    
    private func setUpView() {
        view.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        title = "FoodShop"
        view.addSubview(orderButton)
    }
    
    private let sections = MockData.shared.pageData
}

// MARK: - UICollectionViewDelegate

extension CompositionalViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension CompositionalViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

// MARK: - Constraints

extension CompositionalViewController {
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}

