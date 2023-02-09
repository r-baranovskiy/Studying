//
//  ViewController.swift
//  MVPDesignPattern
//
//  Created by Кащенко on 9.02.23.
//

import UIKit

class UsersViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let presenter = UserPresenter()
    
    private var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.setViewDelegate(delegate: self)
        presenter.getUsers()
    }

    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }

}

extension UsersViewController: UserPresenterDelegate {
    func presentUsers(users: [User]) {
        self.users = users
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func presentAlert(title: String, message: String) {
        
    }
    
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = users[indexPath.row].name
        
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter.didTapUser(user: users[indexPath.row])
    }
}
