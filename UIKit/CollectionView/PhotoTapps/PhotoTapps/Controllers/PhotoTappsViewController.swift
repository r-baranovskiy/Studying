import UIKit

final class PhotoTappsViewController: UIViewController {
    
    private var photos = [UIImage]()
    
    // MARK: - Layout
    
    private let itemsInSection: CGFloat = 3
    private let edgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        
    let photoCollectionView = UICollectionView(
        frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPhotoCollectionView()
        setUpView()
        addConstraints()
        loadImages(firstString: "img", count: 18, imagesArray: &photos)
        print(photos.count)
    }
    
    // MARK: - Behaviour
    
    private func showDetailVC(image: UIImage) {
        let detailVC = DetailPhotoViewController()
        detailVC.image = image
        present(detailVC, animated: true)
    }
    
    private func loadImages(firstString: String, count: Int,
                            imagesArray: inout [UIImage]) {
        var imagesString = [String]()
        
        for imageNum in 1...count {
            imagesString.append("\(firstString)" + "\(imageNum)")
        }
        imagesArray = imagesString.compactMap({ UIImage(named: $0) })
    }
    
    // MARK: - Appearance
    
    private func setUpView() {
        view.backgroundColor = .systemBackground
        title = "PhotoTapps"
        view.addSubview(photoCollectionView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .add)
    }
    
    private func setUpPhotoCollectionView() {
        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.register(
            PhotoCollectionViewCell.self,
            forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
    }

    // MARK: - Constraints
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            photoCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotoTappsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        edgeInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - edgeInsets.right * (itemsInSection + 1)) / itemsInSection
        let height = width
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension PhotoTappsViewController: UICollectionViewDelegate,
                                    UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentImage = photos[indexPath.row]
        showDetailVC(image: currentImage)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCollectionViewCell.identifier,
            for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(image: photos[indexPath.item])
        return cell
    }
}
