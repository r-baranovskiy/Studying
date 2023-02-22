import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            let object = try? JSONDecoder().decode(News.self, from: data)
            
            if let articleList = object {
                completion(articleList.articles)
            }
            
        }.resume()
    }
}
