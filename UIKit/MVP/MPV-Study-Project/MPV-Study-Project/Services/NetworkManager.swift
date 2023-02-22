import Foundation

protocol NetworkManagerProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let safeData = data else { return }
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: safeData)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
