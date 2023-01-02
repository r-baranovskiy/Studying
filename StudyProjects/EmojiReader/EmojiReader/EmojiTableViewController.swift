import UIKit

class EmojiViewController: UIViewController {
    
    let emojiTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        emojiTableView.frame = view.bounds
        emojiTableView.delegate = self
        emojiTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension EmojiViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

