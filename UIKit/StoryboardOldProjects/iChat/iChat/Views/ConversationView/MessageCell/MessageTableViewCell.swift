import UIKit

class MessageTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var messageBackground: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var leftUserPhoto: UIImageView!
    @IBOutlet weak var senderNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        settingsUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func settingsUI () {
        messageBackground.layer.cornerRadius = messageBackground.frame.size.height / 12
        messageLabel.numberOfLines = 0
    }
    
    //MARK: - configure
    
    func updateCell(textMessage: String, isYourMessage: Bool, senderName: String) {
        if isYourMessage {
            userPhoto.isHidden = false
            leftUserPhoto.isHidden = true
            messageBackground.backgroundColor = UIColor(named: KeysColor.messageFromMeColor.rawValue)
        } else {
            leftUserPhoto.isHidden = false
            userPhoto.isHidden = true
            messageBackground.backgroundColor = UIColor(named: KeysColor.messageFromYouColor.rawValue)
        }
        senderNameLabel.text = senderName
        messageLabel.text = textMessage
    }
    
}
