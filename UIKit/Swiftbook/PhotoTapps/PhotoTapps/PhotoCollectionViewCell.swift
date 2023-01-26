import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCollectionViewCell"
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpContentView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpContentView() {
        contentView.backgroundColor = .systemGroupedBackground
        contentView.layer.borderColor = UIColor.systemGray.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 6
        
        contentView.addSubview(cellImageView)
    }
    
    public func configureCell(image: UIImage) {
        cellImageView.image = image
    }
    
    private func setUpConstraints() {
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: topAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
