import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    func getArticles(url: URL, completion: @escaping ([Any]?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                completion(nil)
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            print(data)
        }.resume()
    }
}
