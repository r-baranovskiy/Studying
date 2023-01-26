import UIKit

class ManagerVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    
    //MARK: - Constants
    static var currentLogin = ""
    private var photosArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fillPhotoArray()
        photoCollectionView.reloadData()
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func albumButtonPressed() {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "AlbumVC") as? AlbumVC else { return }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func addImageButtonPressed() {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "AddImageVC") as? AddImageVC else { return }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Functions
    
    private func fillPhotoArray() {
        guard let userDataArray = UserDefaults.standard.value([Photos].self, key: ManagerVC.currentLogin) else { return }
        var photos = [UIImage?]()
        var photoData = [String]()
        
        for photoInUserData in userDataArray {
            let data = photoInUserData.photoData
            photoData.append(data)
            photos.append(loadImageFromData(fileName: data))
        }
        
        if let arrayOfPhoto = photos as? [UIImage] {
            photosArray = arrayOfPhoto
        }
    }
    
    
    
//    private func deleteUser(login: String, password: String) {
//        guard var users = DataManager.value([User].self, forKey: .login) else { return }
//        for (index, user) in users.enumerated() {
//            if login == user.login && password == user.password {
//                deleteAllDataForUser()
//                users.remove(at: index)
//                DataManager.saveData(users, type: .login)
//                UserDefaults.standard.removeObject(forKey: "\(login)")
//                showAlert(title: "User \(ManagerVC.currentLogin) was deleted successfully", message: "", style: .alert, titleButton: "OK", clousure: { _ in
//                    self.navigationController?.popToRootViewController(animated: true)
//                })
//            } else {
//                showAlert(title: "Invalid login or password", message: "", style: .alert, titleButton: "Try again", clousure: nil)
//                return
//            }
//        }
//    }
//
//    private func deleteAllDataForUser() {
//        guard let imageDataArray = UserDefaults.standard.value([Photos].self, key: "\(ManagerVC.currentLogin)") else { return }
//        for data in imageDataArray {
//            let photoData = data.photoData
//            deleteImageFromFileManager(fileName: photoData)
//        }
//    }
    
//    private func deleteImageFromFileManager(fileName: String) {
//        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//            let imageUrl = documentsDirectory.appendingPathComponent(fileName)
//            do {
//                try FileManager.default.removeItem(atPath: imageUrl.path)
//                print("removed old image")
//            } catch let error {
//                print("couldn't remove file", error)
//            }
//        }
//    }
    
//    private func showDeleteAlert() {
//        let alert = UIAlertController(title: "Are you sure?", message: "Your account will be deleted", preferredStyle: .alert)
//        alert.addTextField { (textField: UITextField!) -> Void in
//            textField.placeholder = "Enter your login"
//        }
//
//        alert.addTextField { (textField: UITextField!) -> Void in
//            textField.placeholder = "Enter your password"
//        }
//
//        let cancelAction = UIAlertAction(title: "I changed my mind", style: .cancel, handler: nil)
//        let okAction = UIAlertAction(title: "I'm sure", style: .destructive) { _ in
//            guard let login = alert.textFields?[0].text,
//                  let password = alert.textFields?[1].text
//            else { return }
//            self.deleteUser(login: login, password: password)
//        }
//
//        alert.addAction(cancelAction)
//        alert.addAction(okAction)
//
//        present(alert, animated: true)
//    }
}

extension ManagerVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        
        photoCell.configure(image: photosArray[indexPath.item])
        
        return photoCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (collectionView.frame.size.width - 15) / 2
        return CGSize(width: side, height: side)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}


