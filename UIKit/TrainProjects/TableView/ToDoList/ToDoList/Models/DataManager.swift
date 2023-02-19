import UIKit
import CoreData

/// DataManager that save and load data from userDefaults
final class DataManager {
    
    static let shared = DataManager()
    
    private let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func saveToList(task: List) -> List? {
        guard let safeContext = context else { return nil }
        return List(context: safeContext)
    }
    
    private func saveData() {
        do {
            try safeContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }

}
