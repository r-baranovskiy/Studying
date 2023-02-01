import Foundation

/// DataManager that save and load data from userDefaults
final class DataManager {
    
    static let shared = DataManager()
    
    private let keyForList = "tasksList"
    
    private let userDefaults = UserDefaults.standard
        
    func loadList() -> [Task] {        
        guard let safeList = loadValue([Task].self, for: keyForList) else {
            return [Task]()
        }
        return safeList
    }
    
    func saveList(list: [Task]) {
        saveData(list, for: keyForList)
    }
    
    private func saveData<T: Encodable>(_ value: T?, for key: String) {
        let data = try? JSONEncoder().encode(value)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    private func loadValue<T: Decodable>(_ type: T.Type, for key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key),
              let object = try? JSONDecoder().decode(type, from: data) else { return nil }
        return object
    }

}
