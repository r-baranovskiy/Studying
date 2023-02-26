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
        setUoCollectionView()
        addConstraints()
    }
    
    private func setUpView() {
        view.backgroundColor = .systemBackground
        title = "FoodShop"
        view.addSubview(orderButton)
        view.addSubview(collectionView)
    }
    
    private func setUoCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(
            SaleCollectionViewCell.self,
            forCellWithReuseIdentifier: SaleCollectionViewCell.identifier)
        collectionView.register(
            CategoryCollectionViewCell.self,
            forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.register(
            CouponCollectionViewCell.self,
            forCellWithReuseIdentifier: CouponCollectionViewCell.identifier)
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
            cell.configureCell(categoryName: categories[indexPath.row].title,
                               imageName: categories[indexPath.row].imageString)
            return cell
        case .coupons(let coupons):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CouponCollectionViewCell.identifier,
                for: indexPath) as? CouponCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: coupons[indexPath.row].imageString)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - Constraints

extension CompositionalViewController {
    private func addConstraints() {
        NSLayoutConstraint.activate([
            orderButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -5),
            orderButton.heightAnchor.constraint(equalToConstant: 60),
            orderButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 20),
            orderButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(
                equalTo: orderButton.topAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor)
        ])
    }
}

