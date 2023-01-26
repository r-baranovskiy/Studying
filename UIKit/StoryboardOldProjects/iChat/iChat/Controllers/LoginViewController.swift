import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class LoginViewController: UIViewController {
    
    //MARK: - Constants
    
    private let loginView = LoginView()
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    private var loginButton = UIButton()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        self.view = loginView.loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        emailTextField = loginView.emailTextField
        passwordTextField = loginView.passwordTextField
        loginButton = loginView.loginButton
        
        loginButton.addTarget(self, action: #selector(loginButtonDidPressed), for: .touchUpInside)
    }
    
    //MARK: - Functions
    
    @objc private func loginButtonDidPressed() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                if let errorString = error?.localizedDescription {
                    self.showAlert(withTitle: "Error", withMessage: errorString)
                }
            } else {
                self.openConversationViewController()
            }
        }
    }
    
    private func openConversationViewController() {
        let controller = ConversationViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
