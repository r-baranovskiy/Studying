import Foundation

class DataManager {
    
    
    enum Keys: String {
        case login = "usersKey"
    }
    
    
    static func saveData<T: Encodable>(_ value: T?, type: Keys) {
        let data = try? JSONEncoder().encode(value)
        UserDefaults.standard.set(data, forKey: type.rawValue)
    }
    
    static func value<T: Decodable>(_ type: T.Type, forKey key: Keys) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key.rawValue),
              let object = try? JSONDecoder().decode(type, from: data) else { return nil }
        return object
    }
    
}

extension UserDefaults {
    func set<T: Encodable>(encodable: T, key: String) {
        let data = try? JSONEncoder().encode(encodable)
        set(data, forKey: key)
    }
    
    func value<T: Decodable>(_ type: T.Type, key: String) -> T? {
        if let data = object(forKey: key) as? Data,
           let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return nil
    }
}
