import UIKit

class DetailEmojiViewController: UIViewController {
    
    private let detailTableView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpTableView()
        setUpConstraints()
    }
    
    // MARK: - Appearance
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUpTableView() {
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.backgroundColor = .systemGroupedBackground
        detailTableView.register(DetailTableViewCell.self,
                                 forCellReuseIdentifier: DetailTableViewCell.identifier)
        detailTableView.delegate = self
        detailTableView.dataSource = self
        self.view.addSubview(detailTableView)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            detailTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            detailTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension DetailEmojiViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailTableViewCell.identifier,
            for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0:
            cell.configure(placeholder: "Emoji")
        default:
            break
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Emoji"
        default:
            return "None"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
