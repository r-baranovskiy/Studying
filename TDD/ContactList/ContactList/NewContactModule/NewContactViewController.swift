import UIKit

class NewContactViewController: UIViewController {
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.borderStyle = .line
        return textField
    }()
    
    private let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Surname"
        textField.borderStyle = .line
        return textField
    }()

    private let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Phone"
        textField.borderStyle = .line
        return textField
    }()
    
    private let saveButton: UIButton = {
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
    }
    
    private func setUpView() {
        view.backgroundColor = .systemBackground
        view.addSubview(textFieldsStackView)
    }
    
}

extension NewContactViewController {
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            textFieldsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            textFieldsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            textFieldsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
    }
}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let listVC = NewContactViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListProvider.ContainerView>) -> NewContactViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController: ListProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListProvider.ContainerView>) {
        }
    }
}


