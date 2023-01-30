import UIKit

// MARK: - UI Constants

// TableView
private let listTableView = UITableView()
private let categories = ["Приготовить ужин", "Убраться", "Учить Swift"]

/// The main list that displays tasks' categories
final class ToDoListViewController: UIViewController {
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        configureTableView()
        addConstraints()
    }
    
    // MARK: - Appearance
    
    private func configureNavigationBar() {
        title = "ToDo List"
        navigationController?.navigationBar.backgroundColor = .CustomColor.navigationBar.color
        let textAttribute = [NSAttributedString.Key.foregroundColor : UIColor.label]
        navigationController?.navigationBar.titleTextAttributes = textAttribute
    }
    
    private func configureTableView() {
        listTableView.backgroundColor = .systemBackground
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(ToDoTableViewCell.self,
                               forCellReuseIdentifier: ToDoTableViewCell.identifier)
    }
    
    private func addConstraints() {
        view.addSubviewWithoutTranslates(listTableView)
        
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ToDoTableViewCell.identifier,
            for: indexPath) as? ToDoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(categoryString: categories[indexPath.row])
        return cell
    }
}

