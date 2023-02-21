import UIKit

extension UIButton {
    
    public func pulsate(with duration: TimeInterval) {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = duration
        pulse.fromValue = 0.95
        pulse.toValue = 1
        //Возвращение назад
        pulse.autoreverses = true
        // Первоначальное ускорение
        pulse.initialVelocity = 0.5
        pulse.damping = 1
        layer.add(pulse, forKey: nil)
    }
}
