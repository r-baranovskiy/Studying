import UIKit

final class NewsListViewController: UIViewController {
    
    private lazy var newsTablewView: UITableView = {
        let tableView = UITableView()
        tableView.register(ArticleTableViewCell.self,
                           forCellReuseIdentifier: ArticleTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var newsListViewModel: NewsListViewModel?
    
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
        
        NetworkService.shared.getArticles(url: url) { articles in
            if let articles = articles {
                self.newsListViewModel = NewsListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.newsTablewView.reloadData()
                }
            }
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
        return newsListViewModel?.numberOfRowsInSection ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ArticleTableViewCell
                .identifier, for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        
        let article = newsListViewModel?.articleAtIndex(indexPath.row)
        cell.confiureCell(title: article?.title, description: article?.description)
        return cell
    }
}
