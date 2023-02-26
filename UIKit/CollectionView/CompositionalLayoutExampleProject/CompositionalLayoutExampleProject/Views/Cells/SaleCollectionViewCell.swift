import UIKit

class SaleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SaleCollectionViewCell"
    
    private let saleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(imageName: String) {
        saleImageView.image = UIImage(named: imageName)
    }
    
    private func setUpCell() {
        backgroundColor = .white
        addSubview(saleImageView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            saleImageView.topAnchor.constraint(equalTo: topAnchor),
            saleImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            saleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            saleImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
