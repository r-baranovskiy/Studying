import UIKit

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

final class NetworkService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (
        Result<T, NetworkError>) -> Void) {
            let task = URLSession.shared.dataTask(
                with: resource.url) { (data, rescponse, error) in
                    guard let data = data, error == nil else {
                        completion(.failure(.domainError))
                        return
                    }
                    let result = try? JSONDecoder().decode(T.self, from: data)
                    if let result = result {
                        DispatchQueue.main.async {
                            completion(.success(result))
                        }
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            task.resume()
        }
}
