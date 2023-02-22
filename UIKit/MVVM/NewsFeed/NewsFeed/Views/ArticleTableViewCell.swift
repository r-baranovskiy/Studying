import UIKit

final class ArticleTableViewCell: UITableViewCell {
    
    static let identifier = "ArticleTableViewCell"
    
    private let titleleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private var cellStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createCell()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confiureCell(title: String?, description: String?) {
        titleleLabel.text = title
        descriptionLabel.text = description
    }
    
    private func createCell() {
        selectionStyle = .none
        cellStackView = UIStackView(
            arrangedSubviews: [titleleLabel, descriptionLabel])
        cellStackView.distribution = .fillEqually
        cellStackView.axis = .vertical
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        
        titleleLabel.numberOfLines = 0
        titleleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .medium)
        descriptionLabel.textColor = .systemGray2
        descriptionLabel.setContentHuggingPriority(
            UILayoutPriority(252), for: .vertical)
    }
    
    private func addConstraints() {
        contentView.addSubview(cellStackView)
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
