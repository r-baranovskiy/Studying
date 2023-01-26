import UIKit

class MainVC: UIViewController {
    
    //MARK: - Constants
    
    private var users = [User]()
    private var login: User?
    
    //MARK: - Outlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        users = DataManager.value([User].self, forKey: .login) ?? []
        pickerView.reloadAllComponents()
        hideIfNotExist()
        login = users.first
    }
    
    
    //MARK: - IBActions
    
    @IBAction func loginButtonPressed() {
        guard let login = login,
        let password = passwordTextField.text,
        login.password == password
        else {
            showErrorAlert(title: "Invalid password", message: "", ok: "Try again")
            return
        }
        
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "ManagerVC") as? ManagerVC else { return }
        navigationController?.pushViewController(controller, animated: true)
        ManagerVC.currentLogin = login.login
        passwordTextField.text = nil
    }
    
    @IBAction func registrationButtonPressed() {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationVC") as? RegistrationVC else { return }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Functions
    
    private func hideIfNotExist() {
        if users.isEmpty {
            passwordTextField.isHidden = true
            pickerView.isHidden = true
            loginButton.isHidden = true
        } else {
            passwordTextField.isHidden = false
            pickerView.isHidden = false
            loginButton.isHidden = false
        }
    }
    
    //MARK: - Alers
    
    private func showErrorAlert(title: String, message: String, ok: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: ok, style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        passwordTextField.text = nil
        }
}

//MARK: - Extensions

extension MainVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return users.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return users[row].login
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if users.count == 0 { return }
        login = users[row]
    }
    
}

extension MainVC: UITextFieldDelegate {
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            hideKeyboard()
            return true
        }
    
        func hideKeyboard() {
            passwordTextField.resignFirstResponder()
        }
}




