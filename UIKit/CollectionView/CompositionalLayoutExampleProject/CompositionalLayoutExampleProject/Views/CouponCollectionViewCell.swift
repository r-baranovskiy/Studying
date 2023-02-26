import UIKit

class CouponCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CouponCollectionViewCell"
    
    private let couponImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgorundTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let couponLabel: UILabel = {
        let label = UILabel()
        label.text = "Супер купон"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "5.50 BLR"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold", size: 24)
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        couponImageView.image = UIImage(named: imageName)
    }
    
    private func setUpCell() {
        clipsToBounds = true
        layer.cornerRadius = 10
        
        addSubview(couponImageView)
        addSubview(backgorundTitleView)
        addSubview(couponLabel)
        addSubview(priceLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            couponImageView.topAnchor.constraint(equalTo: topAnchor),
            couponImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            couponImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            couponImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            backgorundTitleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgorundTitleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgorundTitleView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            backgorundTitleView.heightAnchor.constraint(
                equalTo: heightAnchor, multiplier: 0.1),
            
            couponLabel.centerYAnchor.constraint(
                equalTo: backgorundTitleView.centerYAnchor),
            couponLabel.leadingAnchor.constraint(
                equalTo: backgorundTitleView.leadingAnchor, constant: 10),
            
            priceLabel.centerYAnchor.constraint(
                equalTo: backgorundTitleView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(
                equalTo: backgorundTitleView.trailingAnchor, constant: -10)
        ])
    }
}
