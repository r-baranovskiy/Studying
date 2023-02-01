import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    private let api = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    func fetchData() {
        guard let url = URL(string: api) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                guard let safeData = data else { return }
                do {
                    let results = try decoder.decode(PostData.self, from: safeData)
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
