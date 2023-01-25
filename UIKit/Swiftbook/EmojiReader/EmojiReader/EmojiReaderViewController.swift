import UIKit

class EmojiReaderViewController: UIViewController {
    
    let emojis: [EmojiModel] = [
        EmojiModel(title: "Call the friend",
                   discription: "Позвонить другу",
                   emoji: "🛎️", isLiked: false),
        EmojiModel(title: "Feed the cat",
                   discription: "Покормить кота",
                   emoji: "🐷", isLiked: false),
        EmojiModel(title: "Buy the groceries",
                   discription: "Купить продукты",
                   emoji: " 🍕", isLiked: false),
    ]
    
    private let tableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpTableView()
        setUpConstraints()
    }
    
    // MARK: - Behaviour
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
    }
    
    // MARK: - Appearance
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Emoji Reader"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
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
        emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: EmojiReaderTableViewCell.identifier,
            for: indexPath) as? EmojiReaderTableViewCell else {
            return UITableViewCell()
        }
        let emoji = emojis[indexPath.row]
        cell.configureCell(emoji: emoji)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
}


