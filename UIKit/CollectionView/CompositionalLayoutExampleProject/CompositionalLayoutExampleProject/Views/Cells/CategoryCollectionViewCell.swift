import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"

    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 2
                layer.borderColor = UIColor.systemRed.cgColor
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(categoryName: String, imageName: String) {
        categoryLabel.text = categoryName
        categoryImageView.image = UIImage(named: imageName)
    }
    
    private func setUpCell() {
        backgroundColor = .white
        layer.cornerRadius = 10
        addSubview(categoryLabel)
        addSubview(categoryImageView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -5),
            categoryLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 5),
            categoryLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -5),
            categoryLabel.heightAnchor.constraint(equalToConstant: 16),
            
            categoryImageView.topAnchor.constraint(
                equalTo: topAnchor, constant: 5),
            categoryImageView.bottomAnchor.constraint(
                equalTo: categoryLabel.topAnchor),
            categoryImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 5),
            categoryImageView.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -5)
        ])
    }
}
