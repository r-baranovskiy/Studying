
import UIKit

extension UIStackView {
    convenience init(subviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, aligment: UIStackView.Alignment, distribution: UIStackView.Distribution) {
        self.init(arrangedSubviews: subviews)
        self.axis = axis
        self.alignment = aligment
        self.spacing = spacing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
