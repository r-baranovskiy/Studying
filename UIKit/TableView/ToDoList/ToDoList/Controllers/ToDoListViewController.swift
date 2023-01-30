import UIKit

// MARK: - UI Constants

// TableView
private let listTableView = UITableView()
private var categories = ["Приготовить ужин", "Убраться", "Учить Swift"]

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
    
    // MARK: - Behaviour
    
    @objc private func addButtonDidTap() {
        var categoryTextName: String?
        
        let alert = UIAlertController(
            title: "Add new category?", message: "Would you like to add a new category for your tasks?",
            preferredStyle: .alert)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter your categorie's name"
            categoryTextName = alertTextField.text
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let categoryTextName {
                categories.append(categoryTextName)
                listTableView.reloadData()
            }
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    // MARK: - Appearance
    
    private func configureNavigationBar() {
        title = "ToDo List"
        navigationController?.navigationBar.backgroundColor = .CustomColor.navigationBar.color
        let textAttribute = [NSAttributedString.Key.foregroundColor : UIColor.label]
        navigationController?.navigationBar.titleTextAttributes = textAttribute
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(addButtonDidTap))
        navigationItem.rightBarButtonItem?.tintColor = .label
        navigationItem.rightBarButtonItem?.style = .done
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        tableView.cellForRow(at: indexPath)?.accessoryType = tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark ? .none : .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }
    
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

