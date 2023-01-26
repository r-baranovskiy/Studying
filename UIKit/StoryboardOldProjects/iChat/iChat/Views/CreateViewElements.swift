import UIKit

class CreateViewElements {
    
    static func createButton(title: String, backgroundColor: UIColor, titleColor: UIColor, titleFontSize: CGFloat) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: titleFontSize)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
    static func createLabel(text: String, textColor: UIColor, alignment: NSTextAlignment, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.textAlignment = alignment
        label.font = .systemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func createTextField(textAlignment: NSTextAlignment, textColor: UIColor, fontSize: CGFloat, placeholder: String, minFontSize: CGFloat, keyboardType: UIKeyboardType, tintColor: UIColor) -> UITextField {
        let textField = UITextField()
        textField.textAlignment = textAlignment
        textField.textColor = textColor
        textField.font = .systemFont(ofSize: fontSize)
        textField.placeholder = placeholder
        textField.minimumFontSize = minFontSize
        textField.keyboardType = keyboardType
        textField.autocorrectionType = .no
        textField.tintColor = tintColor
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    static func createStepper(value: Double, minValue: Double, maxValue: Double) -> UIStepper {
        let stepper = UIStepper()
        stepper.value = value
        stepper.minimumValue = minValue
        stepper.maximumValue = maxValue
        stepper.stepValue = 1
        stepper.isSelected = true
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }
}

