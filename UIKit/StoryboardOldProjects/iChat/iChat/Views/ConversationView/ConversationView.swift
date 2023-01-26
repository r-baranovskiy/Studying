import UIKit

class ConversationView: UIView {
    
    //MARK: - Constants
    
    var conversationView = UIView()
    
    var conversationTableView = UITableView()
    var messageTextField = UITextField()
    private var messageView = UIView()
    var sendButton = UIButton()
    private var buttonView = UIView()
    
    //MARK: - Override init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        conversationView.addView(messageView)
        conversationView.addView(conversationTableView)
        conversationTableView.separatorStyle = .none
        conversationView.backgroundColor = UIColor.ChatColor.lightPurple
        
        settingsMessageView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Settings UIElements
    
    private func settingsMessageView() {
        messageTextField = CreateViewElements.createTextField(textAlignment: .left, textColor: .darkGray, fontSize: 20, placeholder: "Enter message", minFontSize: 15, keyboardType: .default, tintColor: .white)
        messageTextField.layer.cornerRadius = 20
        sendButton.setBackgroundImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        sendButton.tintColor = .lightGray
        
        messageView.addView(messageTextField)
        buttonView.addView(sendButton)
        messageView.addView(buttonView)
        
        NSLayoutConstraint.activate([
            messageTextField.topAnchor.constraint(equalTo: messageView.topAnchor, constant: 10),
            messageTextField.bottomAnchor.constraint(equalTo: messageView.bottomAnchor, constant: -10),
            messageTextField.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 20),
            messageTextField.widthAnchor.constraint(equalTo: messageView.widthAnchor, multiplier: 0.7),
            
            buttonView.leadingAnchor.constraint(equalTo: messageTextField.trailingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: messageView.trailingAnchor),
            buttonView.heightAnchor.constraint(equalTo: messageTextField.heightAnchor),
            buttonView.centerYAnchor.constraint(equalTo: messageTextField.centerYAnchor),
            
            sendButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            sendButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            sendButton.heightAnchor.constraint(equalTo: messageTextField.heightAnchor, multiplier: 0.8),
            sendButton.widthAnchor.constraint(equalTo: sendButton.heightAnchor, multiplier: 1)
        ])
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            messageView.bottomAnchor.constraint(equalTo: conversationView.safeAreaLayoutGuide.bottomAnchor),
            messageView.leadingAnchor.constraint(equalTo: conversationView.leadingAnchor),
            messageView.trailingAnchor.constraint(equalTo: conversationView.trailingAnchor),
            messageView.heightAnchor.constraint(equalToConstant: 60),
            
            conversationTableView.topAnchor.constraint(equalTo: conversationView.safeAreaLayoutGuide.topAnchor),
            conversationTableView.bottomAnchor.constraint(equalTo: messageView.topAnchor),
            conversationTableView.leadingAnchor.constraint(equalTo: conversationView.leadingAnchor),
            conversationTableView.trailingAnchor.constraint(equalTo: conversationView.trailingAnchor),
        ])
    }
    
}
