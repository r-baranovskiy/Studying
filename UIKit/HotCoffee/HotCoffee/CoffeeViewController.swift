import UIKit

class CoffeeViewController: UIViewController {
    
    private lazy var coffeeTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavBar()
        coffeeTableView.delegate = self
        coffeeTableView.dataSource = self
        addConstraints()
    }
    
    @objc private func addButtonDidTap() {
        let orderVC = OrderViewController()
        let navVC = UINavigationController(rootViewController: orderVC)
        
        present(navVC, animated: true)
    }
    
    // MARK: - Appearance
    
    private func configureNavBar() {
        title = "Coffee"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(addButtonDidTap))
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        view.addSubview(coffeeTableView)
        
        NSLayoutConstraint.activate([
            coffeeTableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            coffeeTableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            coffeeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coffeeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension CoffeeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        
        return cell
    }
}
