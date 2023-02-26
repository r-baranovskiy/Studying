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
        switch sections[indexPath.section] {
        case .sales(let sales):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SaleCollectionViewCell.identifier,
                for: indexPath) as? SaleCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: sales[indexPath.row].imageString)
            return cell
        case .categories(let categories):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCollectionViewCell.identifier,
                for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        case .coupons(let coupons):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CouponCollectionViewCell.identifier,
                for: indexPath) as? CouponCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
    }
}
        
        // MARK: - Constraints
        
        extension CompositionalViewController {
            private func addConstraints() {
                NSLayoutConstraint.activate([
                    
                ])
            }
        }
        
