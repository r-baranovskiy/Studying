import UIKit

final class ToDoTableViewCell: UITableViewCell {
    
    static let identifier = "ToDoTableViewCell"
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    private let categoryStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCategoryStackView()
        self.tintColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(categoryString: String) {
        categoryLabel.text = categoryString
    }
    
    private func setUpCategoryStackView() {
        categoryStackView.axis = .horizontal
        categoryStackView.distribution = .fillProportionally
        categoryStackView.spacing = 15
        
        categoryStackView.addArrangedSubview(categoryLabel)
        
        contentView.addSubviewWithoutTranslates(categoryStackView)
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
