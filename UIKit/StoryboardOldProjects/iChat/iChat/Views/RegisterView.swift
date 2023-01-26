
import UIKit

class RegisterView: UIView {
    
    //MARK: - Constants
    
    var registerView = UIView()
    
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var registerButton = UIButton()
    private var emailTextView = UIView()
    private var passwordTextView = UIView()
    
    //MARK: - Override init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        createEmailView()
        createPasswordView()
        createRegisterButton()
        
        registerView.addView(emailTextView)
        registerView.addView(passwordTextView)
        registerView.addView(registerButton)
        
        setConstraints()
        
        configureColorSet()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Settings UI Elements
    
    private func configureColorSet() {
        registerView.backgroundColor = UIColor(named: KeysColor.registerViewBackground.rawValue)
        emailTextField.textColor = .darkGray
        passwordTextField.textColor = .darkGray
        registerButton.backgroundColor = UIColor(named: KeysColor.registerButtonColor.rawValue)
        registerButton.setTitleColor(UIColor(named: KeysColor.textColor.rawValue), for: .normal)
    }
    
    private func createEmailView() {
        let textImageView = UIImageView(image: UIImage(named: "textfield"))
        
        emailTextField.font = .systemFont(ofSize: 25)
        emailTextField.placeholder = "Email"
        emailTextField.minimumFontSize = 17
        emailTextField.keyboardType = .emailAddress
        emailTextField.borderStyle = .none
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        
        emailTextView.addView(textImageView)
        emailTextView.addView(emailTextField)
        
        NSLayoutConstraint.activate([
            textImageView.topAnchor.constraint(equalTo: emailTextView.topAnchor, constant: 20),
            textImageView.bottomAnchor.constraint(equalTo: emailTextView.bottomAnchor, constant: -20),
            textImageView.leadingAnchor.constraint(equalTo: emailTextView.leadingAnchor),
            textImageView.trailingAnchor.constraint(equalTo: emailTextView.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailTextView.topAnchor, constant: 50),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextView.bottomAnchor, constant: -80),
            emailTextField.leadingAnchor.constraint(equalTo: emailTextView.leadingAnchor, constant: 48),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextView.trailingAnchor, constant: -48),
        ])
    }
    
    private func createPasswordView() {
        let textImageView = UIImageView(image: UIImage(named: "textfield"))
        
        passwordTextField.font = .systemFont(ofSize: 25)
        passwordTextField.placeholder = "Password"
        passwordTextField.minimumFontSize = 17
        passwordTextField.borderStyle = .none
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        
        passwordTextView.addView(textImageView)
        passwordTextView.addView(passwordTextField)
        
        NSLayoutConstraint.activate([
            textImageView.topAnchor.constraint(equalTo: passwordTextView.topAnchor, constant: 20),
            textImageView.bottomAnchor.constraint(equalTo: passwordTextView.bottomAnchor, constant: -20),
            textImageView.leadingAnchor.constraint(equalTo: passwordTextView.leadingAnchor),
            textImageView.trailingAnchor.constraint(equalTo: passwordTextView.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextView.topAnchor, constant: 50),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextView.bottomAnchor, constant: -80),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextView.leadingAnchor, constant: 48),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextView.trailingAnchor, constant: -48),
        ])
    }
    
    private func createRegisterButton() {
        registerButton.setTitle("Register", for: .normal)
        registerButton.layer.cornerRadius = 15
        registerButton.titleLabel?.font = .systemFont(ofSize: 25)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            emailTextView.topAnchor.constraint(equalTo: registerView.safeAreaLayoutGuide.topAnchor),
            emailTextView.leadingAnchor.constraint(equalTo: registerView.leadingAnchor),
            emailTextView.trailingAnchor.constraint(equalTo: registerView.trailingAnchor),
            emailTextView.heightAnchor.constraint(equalToConstant: 177),
            
            passwordTextView.topAnchor.constraint(equalTo: emailTextView.bottomAnchor, constant: -100),
            passwordTextView.leadingAnchor.constraint(equalTo: emailTextView.leadingAnchor),
            passwordTextView.trailingAnchor.constraint(equalTo: emailTextView.trailingAnchor),
            passwordTextView.heightAnchor.constraint(equalTo: emailTextView.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextView.bottomAnchor, constant: 10),
            registerButton.widthAnchor.constraint(equalTo: passwordTextView.widthAnchor, multiplier: 0.3),
            registerButton.centerXAnchor.constraint(equalTo: registerView.centerXAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
