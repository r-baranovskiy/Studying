import UIKit

final class ViewController: UIViewController {
    //MARK:- IB Outlets
    
    @IBOutlet private var tableView: TableView! {
        didSet { tableView.handleSelection = showItem }
    }
    
    @IBOutlet private var menuButton: UIButton!
    @IBOutlet private var titleLabel: UILabel!
    
    @IBOutlet private var menuHeightConstraint: NSLayoutConstraint!
    @IBOutlet private var menuButtonTrailingConstraint: NSLayoutConstraint!

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
        menuButtonTrailingConstraint.constant = menuIsOpen ? 16 : 8
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn) {
            self.menuButton.transform = .init(rotationAngle: self.menuIsOpen ? .pi / 4 : 0)
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
        
        let bottomConstraint = imageView.bottomAnchor.constraint(
            equalTo: view.bottomAnchor, constant: imageView.frame.height)
        let widthConstraint = imageView.widthAnchor.constraint(
            equalTo: view.widthAnchor, multiplier: 1 / 3,  constant: -50)
        
        NSLayoutConstraint.activate([
            bottomConstraint,
            widthConstraint,
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.8) {
            bottomConstraint.constant = imageView.frame.height * -2
            widthConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.8, delay: 1.35) {

        }
        
        UIView.animate(withDuration: 0.6, delay: 2) {
            bottomConstraint.constant = imageView.frame.height
            widthConstraint.constant = -50
            self.view.layoutIfNeeded()
        } completion: { _ in
            imageView.removeFromSuperview()
        }
    }
    
    func transitionCloseMenu() {
        delay(seconds: 0.35, execute: toggleMenu)
    }
}

private func delay(seconds: TimeInterval, execute: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: execute)
}
