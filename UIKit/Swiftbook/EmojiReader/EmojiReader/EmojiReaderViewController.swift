import UIKit

class EmojiReaderViewController: UIViewController {
    
    private let tableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpTableView()
        setUpConstraints()
    }
    
    // MARK: - Appearance
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Emoji Reader"
        navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    private func setUpTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGroupedBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EmojiReaderTableViewCell.self,
                           forCellReuseIdentifier: EmojiReaderTableViewCell.identifier)
        self.view.addSubview(tableView)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension EmojiReaderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: EmojiReaderTableViewCell.identifier,
            for: indexPath) as? EmojiReaderTableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
    
}


