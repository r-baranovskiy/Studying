import UIKit

final class ViewController: UIViewController {
    //MARK:- IB Outlets
    
    @IBOutlet private var tableView: TableView! {
        didSet { tableView.handleSelection = showItem }
    }
    
    @IBOutlet private var menuButton: UIButton!
    @IBOutlet private var titleLabel: UILabel!
    
    @IBOutlet private var menuHeightConstraint: NSLayoutConstraint!
    //MARK:- Variables
    
    private var slider: HorizontalItemSlider!
    private var menuIsOpen = false
}

//MARK:- UIViewController
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider = HorizontalItemSlider(in: view) { [unowned self] item in
            self.tableView.addItem(item)
            self.transitionCloseMenu()
        }
        titleLabel.superview!.addSubview(slider)
    }
}

//MARK:- private
private extension ViewController {
    @IBAction func toggleMenu() {
        menuIsOpen.toggle()
        titleLabel.text = menuIsOpen ? "Select Item!" : "Packing List"
        view.layoutIfNeeded()
        menuHeightConstraint.constant = menuIsOpen ? 200 : 80
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn) {
            self.view.layoutIfNeeded()
        }
    }
    
    func showItem(_ item: Item) {
        let imageView = UIImageView(item: item)
        imageView.backgroundColor = .init(white: 0, alpha: 0.5)
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
    }
    
    func transitionCloseMenu() {
        delay(seconds: 0.35, execute: toggleMenu)
    }
}

private func delay(seconds: TimeInterval, execute: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: execute)
}
