import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailViewPresenterProtocol?
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter?.setComment()
        addConstraints()
    }
    
    private func addConstraints(){
        view.addSubview(detailLabel)
        
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            detailLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            detailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        detailLabel.text = comment?.body
    }
}
