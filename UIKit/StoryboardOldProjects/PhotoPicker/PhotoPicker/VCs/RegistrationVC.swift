import UIKit

class RegistrationVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - IBActions
    
    @IBAction func backButtonPressed() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func registrationButtonPressed() {
        registrationLogin()
    }
    
    //MARK: - Functions
    
    private func registrationLogin() {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              let repeatPassword = repeatPasswordTextField.text,
              !login.isEmpty, !password.isEmpty, !repeatPassword.isEmpty,
              repeatPassword == password
        else { return }
        
        if checkSpecCharacters(login: login, password: password, repPassword: repeatPassword) && checkLoginExist(login: login) {
            
            let user = User.init(login: login, password: password)
            user.saveUsers()
            clearTextField(loginField: loginTextField, passwordField: passwordTextField, repPasswordField: repeatPasswordTextField)
            backButtonPressed()
        } else if checkLoginExist(login: login) == false {
            showErrorAlert(title: "Login already exists", message: "Create another login", ok: "Ok")
            clearTextField(loginField: loginTextField, passwordField: passwordTextField, repPasswordField: repeatPasswordTextField)
        } else {
            showErrorAlert(title: "Login or password contains special characters", message: "", ok: "Try again")
            clearTextField(loginField: loginTextField, passwordField: passwordTextField, repPasswordField: repeatPasswordTextField)
            return
        }
    }
    
    private func checkSpecCharacters(login: String, password: String, repPassword: String) -> Bool {
        if login.hasSpecialCharacters(logOrPass: login) || password.hasSpecialCharacters(logOrPass: password) {
            return false
        }
        return true
    }
    
    
    private func checkLoginExist(login: String) -> Bool {
        let users = DataManager.value([User].self, forKey: .login) ?? []
        for user in users {
            if login == user.login {
                print("login exists")
                return false
            }
        }
        return true
    }
    

    
    private func showErrorAlert(title: String, message: String, ok: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: ok, style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        passwordTextField.text = nil
        }
    
    private func showSuccessAllert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
}

//MARK: - Extensions

extension RegistrationVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    func hideKeyboard() {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()
    }
    
    func clearTextField(loginField: UITextField, passwordField: UITextField, repPasswordField: UITextField) {
        loginField.text = nil
        passwordField.text = nil
        repPasswordField.text = nil
    }
}
