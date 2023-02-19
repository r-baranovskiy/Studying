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
        configureNavBar()
        view.backgroundColor = .darkGray
        coffeeTableView.delegate = self
        coffeeTableView.dataSource = self
        addConstraints()
    }
    
    // MARK: - Appearance
    
    private func configureNavBar() {
        title = "Coffee"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.barTintColor = .darkGray
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
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
