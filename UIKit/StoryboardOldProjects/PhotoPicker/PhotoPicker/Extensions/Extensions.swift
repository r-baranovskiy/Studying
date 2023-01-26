import UIKit

class Extensions: UIViewController {
    
    
}
extension String {
    
    func hasSpecialCharacters(logOrPass: String) -> Bool {
        
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: logOrPass, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, logOrPass.count)) {
                return true
            }
            
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
        
        return false
    }
}

extension UIViewController {
    func showAlert(title: String, message: String, style: UIAlertController.Style, titleButton: String, clousure: ((UIAlertAction) -> Void)?) {
        let controoler = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: titleButton, style: .cancel, handler: clousure)
        controoler.addAction(okAction)
        present(controoler, animated: true)
    }
}



