import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class ConversationViewController: UIViewController {
    
    //MARK: - Constants
    
    private let conversationView = ConversationView()
    private let dateBase = Firestore.firestore()
    
    private var conversationTableView = UITableView()
    private var messageTextField = UITextField()
    private var sendButton = UIButton()
    private var messages = [Message]()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOutButtonPressed))
        navigationItem.hidesBackButton = true
        
        self.view = conversationView.conversationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conversationTableView = conversationView.conversationTableView
        conversationTableView.delegate = self
        conversationTableView.dataSource = self
        conversationTableView.register(UINib(nibName: KeysTableView.cellName.rawValue, bundle: nil),
                                       forCellReuseIdentifier: KeysTableView.cellName.rawValue)
        
        messageTextField = conversationView.messageTextField
        sendButton = conversationView.sendButton
        
        sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
        updateTitle()
        loadMessages()
    }
    
    //MARK: - Functions
    
    private func updateTitle() {
        DispatchQueue.main.async {
            self.title = Auth.auth().currentUser?.email
        }
    }
    
    private func loadMessages() {
        dateBase.collection(KeysFireStore.collectionPath.rawValue)
            .order(by: KeysFireStore.messageTime.rawValue)
            .addSnapshotListener { (querySnapshot, error) in
                
                self.messages = []
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let snaphotDocuments = querySnapshot?.documents {
                        for doc in snaphotDocuments {
                            let data = doc.data()
                            if let sender = data[KeysFireStore.messageSender.rawValue] as? String,
                               let message = data[KeysFireStore.messageBody.rawValue] as? String {
                                let message = Message(sender: sender, message: message)
                                self.messages.append(message)
                                
                                DispatchQueue.main.async {
                                    self.conversationTableView.reloadData()
                                    self.scrollToLast()
                                }
                            }
                        }
                    }
                }
            }
    }
    
    private func scrollToLast() {
        let lastIndexPath = IndexPath(row: messages.count - 1, section: 0)
        conversationTableView.scrollToRow(at: lastIndexPath, at: .top, animated: true)
    }
    
    @objc private func sendButtonPressed() {
        
        if !(messageTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) {
            if let messageBody = messageTextField.text,
               let sender = Auth.auth().currentUser?.email {
                dateBase.collection(KeysFireStore.collectionPath.rawValue).addDocument(data: [
                    KeysFireStore.messageSender.rawValue : sender,
                    KeysFireStore.messageBody.rawValue : messageBody,
                    KeysFireStore.messageTime.rawValue : Date().timeIntervalSince1970])
                { error in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
                messageTextField.text = nil
            }
        }
    }
    
    @objc private func logOutButtonPressed() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

//MARK: - UITableView DataSource and Delegate

extension ConversationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KeysTableView.cellName.rawValue, for: indexPath) as? MessageTableViewCell else {
            return UITableViewCell()
        }
        
        let message = messages[indexPath.row]
        
        var isYourMessage: Bool {
            if Auth.auth().currentUser?.email == message.sender {
                return true
            } else {
                return false
            }
        }
        
        cell.updateCell(textMessage: message.message, isYourMessage: isYourMessage, senderName: message.sender)
        
        cell.selectionStyle = .none
        return cell
    }
    
    
}
