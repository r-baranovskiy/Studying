import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static let identifier = "detailTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with textfield: UITextField) {
        textfield.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textfield)
        
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            textfield.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            textfield.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textfield.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
}
