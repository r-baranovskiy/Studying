import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static let identifier = "DetailTableViewCell"
    
    let infoTextField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpTextField()
        setUpContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(placeholder: String) {
        infoTextField.placeholder = placeholder
    }
    
    private func setUpTextField() {
        infoTextField.translatesAutoresizingMaskIntoConstraints = false
        infoTextField.backgroundColor = .systemYellow
        contentView.addSubview(infoTextField)
    }
    
    // MARK: - Constraints
    
    private func setUpContraints() {
        
        NSLayoutConstraint.activate([
            infoTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            infoTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            infoTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            infoTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
            ])
    }
}
