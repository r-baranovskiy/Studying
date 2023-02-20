import UIKit

class OrderViewController: UIViewController {
    
    private lazy var orderTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let sizeSegmentedControl: UISegmentedControl = {
        let segmContol = UISegmentedControl(items: ["Small", "Medium", "Large"])
        segmContol.translatesAutoresizingMaskIntoConstraints = false
        segmContol.selectedSegmentIndex = 1
        return segmContol
    }()
    
    private let nameTextField = UITextField()
    private let phoneTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        orderTableView.backgroundColor = .brown
        addConstraints()
    }

    private func configureNavBar() {
        view.backgroundColor = .systemBackground
        title = "Order"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close, target: self, action: #selector(returnBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
    }
    
    @objc private func saveTapped() {
        
    }
    
    @objc private func returnBack() {
        dismiss(animated: true)
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        view.addSubview(orderTableView)
        
        NSLayoutConstraint.activate([
            orderTableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            orderTableView.heightAnchor.constraint(
                equalTo: view.heightAnchor, multiplier: 0.5),
            orderTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orderTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.addSubview(sizeSegmentedControl)
        
        NSLayoutConstraint.activate([
            sizeSegmentedControl.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 80),
            sizeSegmentedControl.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -80),
            sizeSegmentedControl.topAnchor.constraint(
                equalTo: orderTableView.bottomAnchor, constant: 40),
            sizeSegmentedControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
