import UIKit

class DetailEmojiViewController: UIViewController {
    
    private let detailTableView = UITableView(frame: .zero, style: .grouped)
    
    private let emojiTextField = UITextField()
    private let titleTextField = UITextField()
    private let descriptionTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTextFields()
        setUpTableView()
        setUpConstraints()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { (contex) in
            self.updateLayout(with: size)
        }
    }
    
    // MARK: - Behaviour
    
    @objc private func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtonPressed() {
        print("saved")
    }
    
    // MARK: - Appearance
    
    private func updateLayout(with size: CGSize) {
        self.detailTableView.frame = CGRect(origin: .zero, size: size)
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self, action: #selector(cancelButtonPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Save", style: .done,
            target: self, action: #selector(saveButtonPressed))
    }
    
    private func setUpTableView() {
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.backgroundColor = .systemGroupedBackground
        detailTableView.register(
            DetailTableViewCell.self,
            forCellReuseIdentifier: DetailTableViewCell.identifier)
        detailTableView.delegate = self
        detailTableView.dataSource = self
        self.view.addSubview(detailTableView)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            detailTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            detailTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func configureTextFields() {
        emojiTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        emojiTextField.placeholder = "Enter emoji"
        titleTextField.placeholder = "Enter title"
        descriptionTextField.placeholder = "Enter description"
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension DetailEmojiViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailTableViewCell.identifier
        ) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
                    case 0:
            cell.configure(with: titleTextField)
                    case 1:
            cell.configure(with: emojiTextField)
                    case 2:
            cell.configure(with: descriptionTextField)
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Title"
        case 1:
            return "Emoji"
        case 2:
            return "Description"
        default:
            return "None"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
