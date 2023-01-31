import Foundation

/// DataManager that save and load data from userDefaults
final class DataManager {
    
    static let shared = DataManager()
    
    private let keyForList = "listNames"
    
    private let userDefaults = UserDefaults.standard
    
    private var list = [String]()
    
    
    func loadList() -> [String] {
        guard let safeList = userDefaults.value(forKey: keyForList) as? [String] else {
            return [String]()
        }
        list = safeList
        return list
    }
    
    func saveList(list: [String]) {
        userDefaults.set(list, forKey: keyForList)
    }

}
