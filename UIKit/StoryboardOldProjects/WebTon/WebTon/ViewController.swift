import UIKit
import WebKit

class ViewController: UIViewController {
    
    
    //MARK: - Constants
    
    private var browserWebView = WKWebView()
    
    //MARK: - Outlets
    
    @IBOutlet weak var bottomScrollConstraint: NSLayoutConstraint!
    @IBOutlet weak var webScrollView: UIScrollView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var webView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var yandexButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var navigationBar: UIView!
    
    
    
    //MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        openWebBrowser()
    }
    
    
    //MARK: - IBActions button
    
    @IBAction func yandexButtonPressed() {
        if searchTextField.text == "" && !yandexButton.isSelected {
            openURLlink(address: "http://yandex.ru")
        } else if searchTextField.text != "" {
            openUsersURL()
        }
        yandexButton.isSelected = true
        checkIsOnBackButton()
        hideKeyboard()
    }
    
    @IBAction func youtubeButtonPressed() {
        browserWebView.reload()
        hideKeyboard()
    }
    
    @IBAction func backButtonPressed() {
        if browserWebView.canGoBack && backButton.isSelected {
            browserWebView.goBack()
        } else {
            yandexButton.isSelected = false
        }
        checkIsOnBackButton()
        hideKeyboard()
    }
    
    //MARK: - Functions
    
    private func openWebBrowser() {
        browserWebView = WKWebView(frame: webView.frame)
        webView.addSubview(browserWebView)
    }
    
    private func openURLlink(address: String) {
        let address = address
        guard let url = URL(string: address) else { return }
        let request = URLRequest(url: url)
        browserWebView.load(request)
        searchTextField.text = ""
    }
    
    private func openUsersURL() {
        guard let urlText = searchTextField.text else { return }
        if !urlText.contains("http://") {
            openURLlink(address: "https://www.google.com/search?q=\(urlText)")
        } else {
            openURLlink(address: urlText)
        }
    }
    
    private func checkIsOnBackButton() {
        if browserWebView.canGoBack {
            backButton.isSelected = true
        } else {
            backButton.isSelected = false
        }
    }
    
    
    
    //MARK: - Settings keyboard
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: NSNotification) {
        
        guard let userInfo = notification.userInfo,
              let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
              let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            bottomScrollConstraint.constant = 0
        } else {
            bottomScrollConstraint.constant = keyboardScreenEndFrame.size.height
        }
        view.needsUpdateConstraints()
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
}

//MARK: - Extensions

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
}


