import UIKit

class AlbumVC: UIViewController {
    
    //MARK: - Constants
    private var photosObject = [Photos]()
    private var maxCountIndexInPhotoArray = Int()
    private var currentIndexInPhotoArray = Int()
    
    //MARK: - Outlets
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var albumView: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var blurAlbumView: UIVisualEffectView!
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkOnNil()
    }
    
    //MARK: - IBActions
    
    @IBAction func backButtonPressed() {
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func previousButtonPressed() {
        showPreviousView()
    }
    
    @IBAction func nextButtonPressed() {
        showNextView()
    }
    
    @IBAction func deletePressed() {
        showDeleteAlert()
    }
    //MARK: - Functions
    
    private func showNextView() {
        if currentIndexInPhotoArray == maxCountIndexInPhotoArray {
            currentIndexInPhotoArray = 0
        } else {
            currentIndexInPhotoArray += 1
        }
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame.size = albumImageView.frame.size
        imageView.frame.origin.x = albumView.frame.maxX
        imageView.frame.origin.y = albumView.frame.origin.y
        imageView.image = getNextPhoto()
        view.addSubview(imageView)
        
        UIImageView.animate(withDuration: 0.3) {
            imageView.frame.origin.x = self.albumImageView.frame.origin.x
        } completion: { _ in
            self.albumImageView.image = imageView.image
            imageView.removeFromSuperview()
        }
    }
    
    private func showPreviousView() {
        if currentIndexInPhotoArray == 0 {
            currentIndexInPhotoArray = maxCountIndexInPhotoArray
        } else {
            currentIndexInPhotoArray -= 1
        }
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame.size = albumImageView.frame.size
        imageView.frame.origin.x = albumView.frame.origin.x - view.frame.width
        imageView.frame.origin.y = albumView.frame.origin.y
        imageView.image = getPreviousPhoto()
        view.addSubview(imageView)
        
        UIImageView.animate(withDuration: 0.3) {
            imageView.frame.origin.x = self.albumView.frame.origin.x
        } completion: { _ in
            self.albumImageView.image = imageView.image
            imageView.removeFromSuperview()
        }
    }
    
    private func deleteData(fileName: String) {
        if deleteImageFromFile(fileName: fileName) {
            photosObject.remove(at: currentIndexInPhotoArray)
            UserDefaults.standard.set(encodable: photosObject, key: ManagerVC.currentLogin)
            viewWillAppear(true)
            showSuccessAlert()
        } else {
            showErrorAlert()
        }
    }
    
    private func getRandomPhoto() {
        let array = photosObject[currentIndexInPhotoArray]
        guard let image = loadImageFromData(fileName: array.photoData) else { return }
        albumImageView.image = image
        descriptionLabel.text = array.photoDescription
    }
    
    private func getNextPhoto() -> UIImage {
        var image = UIImage()
        if let pic = loadImageFromData(fileName: photosObject[currentIndexInPhotoArray].photoData) {
            image = pic
            descriptionLabel.text = photosObject[currentIndexInPhotoArray].photoDescription
        }
        return image
    }
    
    private func getPreviousPhoto() -> UIImage {
        var image = UIImage()
        if let pic = loadImageFromData(fileName: photosObject[currentIndexInPhotoArray].photoData) {
            image = pic
            descriptionLabel.text = photosObject[currentIndexInPhotoArray].photoDescription
        }
        return image
    }
    
    private func checkOnNil() {
        if let isObjectExist = UserDefaults.standard.value([Photos].self, key: "\(ManagerVC.currentLogin)") {
            if !isObjectExist.isEmpty {
                photosObject = isObjectExist
                maxCountIndexInPhotoArray = (photosObject.count - 1)
                checkRandomIndex()
                getRandomPhoto()
                elementsShow()
            } else {
                elementsHide()
                showEmptyAlert()
            }
        }
    }
    
    private func elementsShow() {
        leftButton.isHidden = false
        rightButton.isHidden = false
        deleteButton.isHidden = false
        descriptionLabel.isHidden = false
        blurAlbumView.isHidden = true
    }
    
    private func elementsHide() {
        leftButton.isHidden = true
        rightButton.isHidden = true
        deleteButton.isHidden = true
        albumImageView.image = nil
        descriptionLabel.isHidden = true
        blurAlbumView.isHidden = false
    }
    private func checkRandomIndex() {
        if maxCountIndexInPhotoArray > 1 {
            currentIndexInPhotoArray = .random(in: 0...maxCountIndexInPhotoArray)
        } else {
            currentIndexInPhotoArray = 0
        }
    }
    
    //MARK: - Alerts
    private func showDeleteAlert() {
        let alert = UIAlertController(title: "Are you sure?", message: "Your photo will be deleted", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "I'm not sure", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "I'm sure", style: .destructive) { _ in
            let photoData = self.photosObject[self.currentIndexInPhotoArray].photoData
            self.deleteData(fileName: photoData)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    private func showSuccessAlert() {
        let alert = UIAlertController(title: "The photo was deleted", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showEmptyAlert() {
        let alert = UIAlertController(title: "Photo album is empty", message: "Add your new photos", preferredStyle: .alert)
        present(alert, animated: true)
        let okAction = UIAlertAction(title: "Return", style: .cancel) { _ in
            self.dismiss(animated: false, completion: nil)
            self.navigationController?.popViewController(animated: true)

        }
        alert.addAction(okAction)
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "The photo cannot be deleted", message: "Try again later", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true) {
        }
    }
}

//MARK: - Extensions
extension AlbumVC {
    
    func deleteImageFromFile(fileName: String) -> Bool {
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let imageUrl = documentsDirectory.appendingPathComponent(fileName)
            do {
                try FileManager.default.removeItem(atPath: imageUrl.path)
                print("removed old image")
                return true
            } catch let error {
                print("couldn't remove file", error)
            }
        }
        return false
    }
}
