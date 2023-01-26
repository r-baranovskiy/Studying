import UIKit

class EmojiReaderViewController: UIViewController, DetailEmojiViewControllerDelegate {
    
    private var emojis: [EmojiModel] = [
        EmojiModel(title: "Call the friend",
                   description: "Позвонить другу",
                   emoji: "🛎️", isLiked: false),
        EmojiModel(title: "Feed the cat",
                   description: "Покормить кота",
                   emoji: "🐷", isLiked: false),
        EmojiModel(title: "Buy the groceries",
                   description: "Купить продукты",
                   emoji: " 🍕", isLiked: false),
    ]
    
    private let emojiTableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpTableView()
        setUpConstraints()
        
    }
    
    // MARK: - Behaviour
    
    @objc private func showDetailEmojiViewController() {
        let detailVC = DetailEmojiViewController()
        let navVC = UINavigationController(rootViewController: detailVC)
        detailVC.delegate = self
        present(navVC, animated: true)
    }
    
    func emojiDidAdded(_ emoji: EmojiModel) {
        emojis.append(emoji)
        emojiTableView.reloadData()
    }
    
    // MARK: - Appearance
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Emoji Reader"
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self, action: #selector(showDetailEmojiViewController))
    }
    
    private func setUpTableView() {
        emojiTableView.translatesAutoresizingMaskIntoConstraints = false
        emojiTableView.backgroundColor = .systemGroupedBackground
        emojiTableView.delegate = self
        emojiTableView.dataSource = self
        emojiTableView.register(EmojiReaderTableViewCell.self,
                           forCellReuseIdentifier: EmojiReaderTableViewCell.identifier)
        self.view.addSubview(emojiTableView)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            emojiTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            emojiTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            emojiTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            emojiTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
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
    
    // Editing cell (Delete)
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        emojiTableView.setEditing(editing, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Move cell
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }

    // Left buttons
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let doneAction = UIContextualAction(
            style: .destructive, title: "Done") { _, _, completion in
                self.emojis.remove(at: indexPath.row)
                self.emojiTableView.deleteRows(at: [indexPath], with: .automatic)
                completion(true)
            }
        doneAction.backgroundColor = .systemGreen
        
        let likeAction = UIContextualAction(
            style: .normal, title: "Like") { _, _, completion in
                self.emojis[indexPath.row].isLiked = !self.emojis[indexPath.row].isLiked
                completion(true)
            }
        likeAction.image = UIImage(systemName: "heart")
        likeAction.backgroundColor = self.emojis[indexPath.row].isLiked ? .systemRed : .label
        
        return UISwipeActionsConfiguration(actions: [doneAction, likeAction])
    }
}
