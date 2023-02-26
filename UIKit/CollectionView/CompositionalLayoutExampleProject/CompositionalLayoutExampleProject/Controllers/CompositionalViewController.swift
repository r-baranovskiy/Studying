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
    
    private let sections = MockData.shared.pageData
    
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
        collectionView.register(
            HeaderCollectionView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCollectionView.identifier)
        
        collectionView.collectionViewLayout = createLayout()
    }
}

// MARK: - UICollectionViewCompositionalLayout

extension CompositionalViewController {
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .sales(_):
                return createSaleSection()
            case .categories(_):
                return createCategorySection()
            case .coupons(_):
                return createCouponSection()
            }
        }
    }
}

private func createLayoutSection(
    group: NSCollectionLayoutGroup, interGroupSpacing: CGFloat,
    behaviour: UICollectionLayoutSectionOrthogonalScrollingBehavior,
    supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
    contentInsets: Bool) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behaviour
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
    }

private func createSaleSection() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1),
        heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(0.9),
        heightDimension: .fractionalHeight(0.2))
    let group = NSCollectionLayoutGroup.horizontal(
        layoutSize: groupSize,
        subitems: [item])
    
    let section = createLayoutSection(
        group: group, interGroupSpacing: 5, behaviour: .groupPaging,
        supplementaryItems: [], contentInsets: false)

    section.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 0)
    return section
}

private func createCategorySection() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(0.3),
        heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1),
        heightDimension: .fractionalHeight(0.1))
    let group = NSCollectionLayoutGroup.horizontal(
        layoutSize: groupSize,
        subitems: [item])
    
    let supplementaryHeaderItem = supplementaryHeaderItem()
    
    let section = createLayoutSection(
        group: group, interGroupSpacing: 10, behaviour: .none,
        supplementaryItems: [supplementaryHeaderItem], contentInsets: false)

    section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
    return section
}

private func createCouponSection() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1),
        heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1),
        heightDimension: .fractionalHeight(0.45))
    let group = NSCollectionLayoutGroup.horizontal(
        layoutSize: groupSize,
        subitems: [item])
    
    let supplementaryHeaderItem = supplementaryHeaderItem()
    
    let section = createLayoutSection(
        group: group, interGroupSpacing: 10, behaviour: .continuous,
        supplementaryItems: [supplementaryHeaderItem], contentInsets: false)

    section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 0)
    return section
}

private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
    .init(layoutSize: NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1), heightDimension: .estimated(30)),
          elementKind: UICollectionView.elementKindSectionHeader,
          alignment: .top)
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
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderCollectionView.identifier,
                for: indexPath) as? HeaderCollectionView else {
                return UICollectionReusableView()
            }
            header.configureHeader(categoryName: sections[indexPath.row].title)
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

