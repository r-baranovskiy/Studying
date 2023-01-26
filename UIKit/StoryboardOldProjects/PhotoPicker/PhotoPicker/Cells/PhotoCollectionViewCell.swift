

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCollectionImageView: UIImageView!
    
    
    func configure(image: UIImage) {
        imageCollectionImageView.image = image
        imageCollectionImageView.layer.cornerRadius = 15
        imageCollectionImageView.layer.borderWidth = 2
        imageCollectionImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
