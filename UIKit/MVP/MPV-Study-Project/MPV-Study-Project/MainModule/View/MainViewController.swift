import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol?
    
    private let mainTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        addConstraints()
    }
    
    private func configureTableView() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func addConstraints() {
        view.addSubview(mainTableView)
        
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension MainViewController: MainViewProtocol {
    func success() {
        mainTableView.reloadData()
    }
    
    func failture(error: Error) {
        print(error.localizedDescription)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let comment = presenter?.comments?[indexPath.row] else { return }
        let detailVC = ModelBuilder.createDetailViewModule(comment: comment)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let comment = presenter?.comments?[indexPath.row]
        
        cell.textLabel?.text = comment?.body
        return cell
    }
}

