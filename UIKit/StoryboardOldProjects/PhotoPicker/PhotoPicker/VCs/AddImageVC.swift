import UIKit

class AddImageVC: UIViewController {
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var loadImage: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    //MARK: - Constants
    private var photoObjects = [Photos]()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    //MARK: - IBActions
    
    @IBAction func saveImageButtonPressed() {
        uploadData()
        showAlert(title: "The photo was added successfully", message: "", style: .alert, titleButton: "Continue", clousure: nil)
        descriptionTextField.text = nil
        loadImage.image = nil
        saveButton.isHidden = true
        descriptionTextField.isHidden = true
    }
    
    @IBAction func backButtonPressed() {
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func fromCameraButtonPressed() {
        loadPhotoFromGallery(sourceType: .camera, title: "Allow access to the camera?")
    }
    
    @IBAction func fromGallery() {
        loadPhotoFromGallery(sourceType: .photoLibrary, title: "Allow access to the gallery?")
    }
    
    //MARK: - Private functions
    
    private func uploadData() {
        guard let image = loadImage.image else { return }
        guard let imageName = uploadImageData(image: image) else { return }
        let description = descriptionTextField.text ?? "Description is missed"
        let photo = Photos(photoData: imageName, photoDescription: description)
        photo.savePhotoObject()
    }
    
    private func loadPhotoFromGallery(sourceType: UIImagePickerController.SourceType, title: String) {
        showAlert(title: title, message: "") { _ in
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.allowsEditing = true
            picker.delegate = self
            self.present(picker, animated: true)
        }
    }
}
//MARK: - Extensions

extension AddImageVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            loadImage.image = image
            saveButton.isHidden = false
            descriptionTextField.isHidden = false
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            loadImage.image = image
            saveButton.isHidden = false
            descriptionTextField.isHidden = false
        }
        picker.dismiss(animated: true)
    }
}

extension AddImageVC {
    
    func showAlert(title: String, message: String, handlerOk: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Allow", style: .default, handler: handlerOk)
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Don't allow", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

extension AddImageVC: UITextFieldDelegate {
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            hideKeyboard()
            return true
        }
    
        func hideKeyboard() {
            descriptionTextField.resignFirstResponder()
        }
}
