import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseCoreInternal

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Constants
    
    private let registerView = RegisterView()
    private var registerButton = UIButton()
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        self.view = registerView.registerView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton = registerView.registerButton
        emailTextField = registerView.emailTextField
        passwordTextField = registerView.passwordTextField
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        registerButton.addTarget(self, action: #selector(registerButtonDidPressed), for: .touchUpInside)
    }
    
    //MARK: - Functions
    
    @objc private func registerButtonDidPressed() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error?.localizedDescription != nil {
                if let errorString = error?.localizedDescription {
                    self.showAlert(withTitle: "Error", withMessage: errorString)
                    return
                }
            } else {
                self.openConversationController()
            }
        }
        emailTextField.text = nil
        passwordTextField.text = nil
    }
    
    private func openConversationController() {
        let controller = ConversationViewController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - TextField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
