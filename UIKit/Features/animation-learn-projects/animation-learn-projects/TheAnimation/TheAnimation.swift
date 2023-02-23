import UIKit
import TheAnimation

final class TheAnimation: UIViewController {
    
    private let layer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.systemRed.cgColor
        layer.frame.size = CGSize(width: 150, height: 150)
        return layer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layer.frame.origin = CGPoint(x: 100, y: 100)
        view.layer.addSublayer(layer)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.rotate()
        })
    }
    
    private func rotate() {
        let animation = BasicAnimation(keyPath: .transformRotationZ)
        
        animation.fromValue = 0
       
        animation.toValue = .pi / 2
        animation.duration = 1
        animation.timingFunction = .linear
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
    
        animation.animate(in: layer)
    }
    
    private func animateSquare() {
        let animation = BasicAnimation(keyPath: .position)
        
        animation.fromValue = CGPoint(
            x: layer.frame.origin.x + layer.frame.size.width / 2,
            y: layer.frame.origin.y + layer.frame.size.height / 2)
       
        animation.toValue = CGPoint(
            x: layer.frame.origin.x + 150,
            y: layer.frame.origin.y + 150)
        animation.duration = 2
        animation.timingFunction = .easeInEaseOut
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
    
        animation.animate(in: layer)
    }

}

