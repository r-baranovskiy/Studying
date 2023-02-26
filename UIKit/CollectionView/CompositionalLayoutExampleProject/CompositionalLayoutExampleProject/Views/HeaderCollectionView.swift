import UIKit

class HeaderCollectionView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionView"
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Header"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpHeader()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(categoryName: String) {
        headerLabel.text = categoryName
    }
    
    private func setUpHeader() {
        backgroundColor = .white
        addSubview(headerLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 10)
        ])
    }
}
