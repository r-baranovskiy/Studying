import UIKit
class StartViewController: UIViewController, StartViewModelProtocol {
    
    //MARK: - Constraints
    
    private var startViewModel = StartView()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        startViewModel.delegate = self
        self.view = startViewModel.startView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .darkGray
    }
    
    //MARK: - StartViewModelDelegate
    
    func loginButtonDidPressed() {
        let controller = LoginViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func registerButtonDidPressed() {
        let controller = RegisterViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

}

