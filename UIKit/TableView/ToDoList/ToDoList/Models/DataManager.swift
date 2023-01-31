import Foundation

/// DataManager that save and load data from userDefaults
final class DataManager {
    
    static let shared = DataManager()
    
    private let dataFilePath = FileManager.default.urls(
        for: .documentDirectory, in: .userDomainMask).first?.appendingPathExtension("tasksList")
    
    func loadList() -> [Task] {
        guard let dataUrl = dataFilePath,
              let data = loadData(from: dataUrl),
              let tasks = try? JSONDecoder().decode([Task].self, from: data)
        else {
            return [Task]()
        }
        
        return tasks
    }
    
    func saveList(list: [Task]) {
        guard let dataUrl = dataFilePath else {
            return
        }
        
        saveData(list, to: dataUrl)
    }
    
    private func saveData(_ data: Codable, to url: URL) {
        do {
            let data = try JSONEncoder().encode(data)
            try data.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func loadData(from url: URL) -> Data? {
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        return data
    }
}
