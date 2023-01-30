import UIKit

extension UIView {
    
    func addSubviewWithoutTranslates(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviewWithoutTranslates(_ views: UIView...) {
        views.forEach({ $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0) })
    }
}
