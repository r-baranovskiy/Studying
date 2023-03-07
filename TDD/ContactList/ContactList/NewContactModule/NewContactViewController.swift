import UIKit

class NewContactViewController: UIViewController {
    
    var contactManager: ContactManager!
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.borderStyle = .line
        return textField
    }()
    
    let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Surname"
        textField.borderStyle = .line
        return textField
    }()

    let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Phone"
        textField.borderStyle = .line
        return textField
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.sizeToFit()
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.sizeToFit()
        return button
    }()
    
    private lazy var textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(surnameTextField)
        stackView.addArrangedSubview(phoneTextField)
        stackView.addArrangedSubview(saveButton)
        stackView.addArrangedSubview(cancelButton)
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 50
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        addConstraints()
        saveButton.addTarget(self, action: #selector(saveButtonDidTap),
                             for: .touchUpInside)
    }
    
    @objc func saveButtonDidTap() {
        let name = nameTextField.text
        let surname = surnameTextField.text
        let phone = phoneTextField.text
        let imageData = UIImage(systemName: "person")?.pngData()
        
        let person = Person(name: name ?? "", phone: phone ?? "",
                            surname: surname ?? "", imageData: imageData)
        contactManager.add(person: person)
    }
    
    private func setUpView() {
        view.backgroundColor = .systemBackground
        view.addSubview(textFieldsStackView)
    }
}

extension NewContactViewController {
    private func addConstraints() {
        NSLayoutConstraint.activate([
            textFieldsStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            textFieldsStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 50),
            textFieldsStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -50),
        ])
    }
}
