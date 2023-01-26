import UIKit
class LoginView: UIView {
    
    //MARK: - Constants
    
    var loginView = UIView()

    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var loginButton = UIButton()
    private var emailTextView = UIView()
    private var passwordTextView = UIView()
    
    //MARK: - Override init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        createEmailView()
        createPasswordView()
        createLoginButton()
        
        loginView.addView(emailTextView)
        loginView.addView(passwordTextView)
        loginView.addView(loginButton)
        
        setConstraints()
        
        configureColorSet()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Settings UI Elements
    
    private func configureColorSet() {
        loginView.backgroundColor = UIColor(named: KeysColor.startBackGroundColor.rawValue)
        emailTextField.textColor = UIColor(named: KeysColor.textColor.rawValue)
        passwordTextField.textColor = UIColor(named: KeysColor.textColor.rawValue)
        loginButton.setTitleColor(UIColor(named: KeysColor.textColor.rawValue), for: .normal)
        loginButton.backgroundColor = UIColor(named: KeysColor.loginButtonColor.rawValue)
    }
    
    private func createEmailView() {
        let textImageView = UIImageView(image: UIImage(named: "textfield"))
        
        emailTextField.font = .systemFont(ofSize: 25)
        emailTextField.textAlignment = .left
        emailTextField.minimumFontSize = 17
        emailTextField.keyboardType = .emailAddress
        emailTextField.borderStyle = .none
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        
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
        passwordTextField.textAlignment = .left
        passwordTextField.minimumFontSize = 17
        passwordTextField.borderStyle = .none
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
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
    
    private func createLoginButton() {
        loginButton.setTitle("Log In", for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 25)
        loginButton.layer.cornerRadius = 15
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            emailTextView.topAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.topAnchor),
            emailTextView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            emailTextView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            emailTextView.heightAnchor.constraint(equalToConstant: 177),
            
            passwordTextView.topAnchor.constraint(equalTo: emailTextView.bottomAnchor, constant: -100),
            passwordTextView.leadingAnchor.constraint(equalTo: emailTextView.leadingAnchor),
            passwordTextView.trailingAnchor.constraint(equalTo: emailTextView.trailingAnchor),
            passwordTextView.heightAnchor.constraint(equalTo: emailTextView.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextView.bottomAnchor, constant: 10),
            loginButton.widthAnchor.constraint(equalTo: passwordTextView.widthAnchor, multiplier: 0.3),
            loginButton.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
}


