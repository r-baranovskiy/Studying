import UIKit

/// The main list that displays tasks' categories
final class ToDoListViewController: UIViewController {
    
    // MARK: - UI Constants
    
    // TableView
    private let listTableView = UITableView()
    
    // Data
    private let dataManager = DataManager.shared
    
    private var listArray = [Task]()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listArray = dataManager.loadList()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        configureTableView()
        addConstraints()
    }
    
    // MARK: - Behaviour
    
    @objc private func addButtonDidTap() {
        var textField = UITextField()
        
        let alert = UIAlertController(
            title: "Add new category?", message: "Would you like to add a new category for your tasks?",
            preferredStyle: .alert)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter your categorie's name"
            textField = alertTextField
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let text = textField.text {
                let task = Task(title: text, isChecked: false)
                self.saveToListAndReload(task)
            }
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func saveToListAndReload(_ task: Task) {
        listArray.append(task)
        dataManager.saveList(list: listArray)
        listTableView.reloadData()
    }
    
    private func replaceTask(_ task: Task, _ indexPath: IndexPath) {
        listArray.insert(task, at: indexPath.row)
        dataManager.saveList(list: listArray)
        listTableView.reloadData()
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
    
    // MARK: - Constraints
    
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
        listArray[indexPath.row].isChecked = !listArray[indexPath.row].isChecked
        saveToListAndReload(listArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ToDoTableViewCell.identifier,
            for: indexPath) as? ToDoTableViewCell else {
            return UITableViewCell()
        }
        let task = listArray[indexPath.row]
        cell.configure(categoryString: task.title, isChecked: task.isChecked)
        return cell
    }
}

