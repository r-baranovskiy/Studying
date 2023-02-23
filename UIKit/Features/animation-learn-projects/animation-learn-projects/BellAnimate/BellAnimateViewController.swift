import UIKit

final class BellAnimateViewController: UIViewController {
    
    // MARK: - UI Constants
    
    private let durationLabel = UILabel()
    private let angleLabel = UILabel()
    private let offsetLabel = UILabel()
    private let rotationLabel = UILabel()
    
    private let bellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bell")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let durationSlider: UISlider = {
        let slider = UISlider()
        
        return slider
    }()
    
    private let angleSlider: UISlider = {
        let slider = UISlider()
        
        return slider
    }()
    
    private let offsetSlider: UISlider = {
        let slider = UISlider()
        
        return slider
    }()
    
    private let rotationSlider: UISlider = {
        let slider = UISlider()
        
        return slider
    }()
    
    private var slidersStackView = UIStackView()
    
    // MARK: - Properties
    
    private var duration = 1.0 {
        didSet {
            shakeWith(duration: duration, angle: angle, yOffset: yOffset)
        }
    }
    
    private var angle: CGFloat = .pi / 8 {
        didSet {
            shakeWith(duration: duration, angle: angle, yOffset: yOffset)
        }
    }
    
    private var yOffset: CGFloat = 0.5 {
        didSet {
            shakeWith(duration: duration, angle: angle, yOffset: yOffset)
        }
    }
    
    private var rotation: CGFloat = 1 {
        didSet {
            bellImageView.transform = CGAffineTransform(rotationAngle: rotation)
            shakeWith(duration: duration, angle: angle, yOffset: yOffset)
        }
    }
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addTargets()
        createStackView()
        addConstraints()
    }
    
    // MARK: - Behaviour
    
    private func addTargets() {
        durationSlider.addTarget(self, action: #selector(sliderValueChanged),
                                 for: .valueChanged)
        angleSlider.addTarget(self, action: #selector(sliderValueChanged),
                                 for: .valueChanged)
        offsetSlider.addTarget(self, action: #selector(sliderValueChanged),
                                 for: .valueChanged)
        rotationSlider.addTarget(self, action: #selector(sliderValueChanged),
                                 for: .valueChanged)
        
        durationSlider.tag = 0
        angleSlider.tag = 1
        offsetSlider.tag = 2
        rotationSlider.tag = 3
    }
    
    @objc private func sliderValueChanged(_ slider: UISlider) {
        switch slider.tag {
        case 0:
            duration = Double(slider.value) * 2
        case 1:
            angle = CGFloat(slider.value) * .pi / 2
        case 2:
            yOffset = CGFloat(slider.value)
        case 3:
            rotation = CGFloat(slider.value)
        default:
            break
        }
    }
    
    // MARK: - Appearance
    
    private func createStackView() {
        durationLabel.text = "Duration"
        angleLabel.text = "Angle"
        offsetLabel.text = "Offset"
        rotationLabel.text = "Rotation"
        
        slidersStackView = UIStackView(arrangedSubviews: [
            durationLabel, durationSlider,
            angleLabel, angleSlider,
            offsetLabel, offsetSlider,
            rotationLabel, rotationSlider
        ])
        slidersStackView.alignment = .fill
        slidersStackView.axis = .vertical
        slidersStackView.distribution = .equalSpacing
        slidersStackView.spacing = 15
        slidersStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addConstraints() {
        view.addSubview(bellImageView)
        view.addSubview(slidersStackView)
        
        NSLayoutConstraint.activate([
            bellImageView.heightAnchor.constraint(equalToConstant: 150),
            bellImageView.widthAnchor.constraint(
                equalTo: bellImageView.heightAnchor),
            bellImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bellImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
        ])
        
        NSLayoutConstraint.activate([
            slidersStackView.topAnchor.constraint(
                equalTo: bellImageView.bottomAnchor, constant: 80),
            slidersStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 50),
            slidersStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -50),
            slidersStackView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension BellAnimateViewController {
    @objc private func bellImageViewTapped(_ recognizer: UITapGestureRecognizer) {
        
    }
    
    private func shakeWith(duration: Double, angle: CGFloat, yOffset: CGFloat) {
        let numberOfFrames = 6.0
        let frameDuration = Double(1 / numberOfFrames)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: frameDuration) {
                self.bellImageView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            
            UIView.addKeyframe(withRelativeStartTime: frameDuration,
                               relativeDuration: frameDuration) {
                self.bellImageView.transform = CGAffineTransform(rotationAngle: +angle)
            }
            
            UIView.addKeyframe(withRelativeStartTime: frameDuration * 2,
                               relativeDuration: frameDuration) {
                self.bellImageView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            
            UIView.addKeyframe(withRelativeStartTime: frameDuration * 3,
                               relativeDuration: frameDuration) {
                self.bellImageView.transform = CGAffineTransform(rotationAngle: +angle)
            }
            
            UIView.addKeyframe(withRelativeStartTime: frameDuration * 4,
                               relativeDuration: frameDuration) {
                self.bellImageView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            
            UIView.addKeyframe(withRelativeStartTime: frameDuration * 5,
                               relativeDuration: frameDuration) {
                self.bellImageView.transform = CGAffineTransform.identity
            }
        }
    }
}

