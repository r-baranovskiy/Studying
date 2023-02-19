import UIKit

final class NewsListViewController: UIViewController {
    
    private lazy var newsTablewView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        configureNavBar()
        newsTablewView.delegate = self
        newsTablewView.dataSource = self
        getArticles()
        addConstraints()
    }
    
    // MARK: - Behaviour
    
    private func getArticles() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=8d044529a4d64f60990ef2a8a3702902") else {
            return
        }
        
        NetworkService.shared.getArticles(url: url) { _ in
            
        }
    }
    
    // MARK: - Appearance
    
    private func configureNavBar() {
        title = "NewsFeed"
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
        view.addSubview(newsTablewView)
        
        NSLayoutConstraint.activate([
            newsTablewView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsTablewView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newsTablewView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTablewView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTablewView.dequeueReusableCell(
            withIdentifier: "cell", for: indexPath)
        
        return cell
    }
}
