import UIKit

protocol StartViewModelProtocol: AnyObject {
    func registerButtonDidPressed()
    func loginButtonDidPressed()
}

class StartView: UIView {
    
    //MARK: - Constants
    
    var startView = UIView()
    
    weak var delegate: StartViewModelProtocol?
    
    private var brandLabel = UILabel()
    private var logInButton = UIButton()
    private var registerButton = UIButton()
    
    //MARK: - Override init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        startView.backgroundColor = UIColor(named: KeysColor.startBackGroundColor.rawValue)
        showAnimateLabel()
        
        createBrandLabel()
        createLoginButton()
        createRegisterButton()
        
        startView.addView(brandLabel)
        startView.addView(logInButton)
        startView.addView(registerButton)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    
    @objc private func registerButtonTapped() {
        delegate?.registerButtonDidPressed()
    }
    
    @objc private func loginButtonTapped() {
        delegate?.loginButtonDidPressed()
    }
    
    //MARK: - Settings UI Elements
    
    private func showAnimateLabel() {
        let nameLabel = "⚡️iChat⚡️"
        var charIndex = 0.0
        
        for char in nameLabel {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { _ in
                self.brandLabel.text?.append(char)
            }
            charIndex += 1
        }
        
    }
    
    private func createRegisterButton() {
        registerButton = CreateViewElements.createButton(title: "Register",
                                                         backgroundColor: UIColor(named: KeysColor.registerButtonColor.rawValue) ?? .blue,
                                                         titleColor: UIColor(named: KeysColor.textColor.rawValue) ?? .label,
                                                         titleFontSize: 30)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.layer.cornerRadius = 20
    }
    
    private func createLoginButton() {
        logInButton = CreateViewElements.createButton(title: "Log In",
                                                      backgroundColor: UIColor(named: KeysColor.loginButtonColor.rawValue) ?? .systemTeal,
                                                      titleColor: UIColor(named: KeysColor.textColor.rawValue) ?? .label,
                                                      titleFontSize: 30)
        logInButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        logInButton.layer.cornerRadius = 20
    }
    
    private func createBrandLabel() {
        brandLabel.text = ""
        brandLabel.textColor = UIColor(named: KeysColor.textColor.rawValue)
        brandLabel.textAlignment = .natural
        brandLabel.font = UIFont.boldSystemFont(ofSize: 50)
        brandLabel.adjustsFontSizeToFitWidth = true
        brandLabel.minimumScaleFactor = 0.3
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            brandLabel.centerYAnchor.constraint(equalTo: startView.centerYAnchor),
            brandLabel.centerXAnchor.constraint(equalTo: startView.centerXAnchor),
            brandLabel.widthAnchor.constraint(equalTo: startView.widthAnchor, multiplier: 0.6),
            
            logInButton.bottomAnchor.constraint(equalTo: startView.safeAreaLayoutGuide.bottomAnchor),
            logInButton.leadingAnchor.constraint(equalTo: startView.leadingAnchor, constant: 20),
            logInButton.trailingAnchor.constraint(equalTo: startView.trailingAnchor, constant: -20),
            logInButton.heightAnchor.constraint(equalToConstant: 61),
            
            registerButton.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -8),
            registerButton.leadingAnchor.constraint(equalTo: logInButton.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: logInButton.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: logInButton.heightAnchor)
        ])
    }
    
}

