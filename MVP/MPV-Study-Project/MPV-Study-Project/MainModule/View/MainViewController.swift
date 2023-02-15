import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol?
    
    private let mainTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        addConstraints()
    }
    
    private func configureTableView() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.backgroundColor = .gray
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
    func setGreeting(greeting: String) {
        //self.greetingLabel.text = greeting
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Test"
        cell.backgroundColor = .blue
        return cell
    }
}

