import UIKit

class EmojiReaderTableViewCell: UITableViewCell {
    
    static let identifier = "EmojiReaderTableViewCell"
    
    private let cellStackView = UIStackView()
    
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let titleTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let discriptionTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCellStackView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Appearance
    
    func configureCell(emoji: EmojiModel) {
        emojiLabel.text = emoji.emoji
        titleTextLabel.text = emoji.title
        discriptionTextLabel.text = emoji.discription
    }
    
    private func configureCellStackView() {
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.spacing = 10
        
        let emojiStackView = UIStackView()
        
        emojiStackView.addArrangedSubview(emojiLabel)
        
        let labelsStackView = UIStackView()
        labelsStackView.axis = .vertical
        labelsStackView.addArrangedSubview(titleTextLabel)
        labelsStackView.addArrangedSubview(discriptionTextLabel)
        
        cellStackView.addArrangedSubview(emojiStackView)
        cellStackView.addArrangedSubview(labelsStackView)
        
        contentView.addSubview(cellStackView)
    }
    
    // MARK: - Constraints
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            cellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            emojiLabel.widthAnchor.constraint(equalTo: cellStackView.widthAnchor, multiplier: 0.1)
        ])
    }
    
}
