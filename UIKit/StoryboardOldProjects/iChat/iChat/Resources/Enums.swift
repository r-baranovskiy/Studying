
import Foundation

enum KeysFireStore: String {
    case collectionPath = "messages"
    case messageSender = "sender"
    case messageBody = "messageText"
    case messageTime = "messageTime"
}

enum KeysTableView: String {
    case cellName = "MessageTableViewCell"
}

enum KeysColor: String {
    case messageFromMeColor = "messageFromMeColor"
    case messageFromYouColor = "messageFromYouColor"
    case startBackGroundColor = "startBackgroundColor"
    case loginButtonColor = "loginButtonColor"
    case registerButtonColor = "registerButtonColor"
    case textColor = "textColor"
    case registerViewBackground = "registerViewBackgroundColor"
    case loginViewBackground = "loginViewBackgroundColor"
}
