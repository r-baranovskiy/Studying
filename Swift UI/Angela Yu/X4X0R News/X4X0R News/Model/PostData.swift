import Foundation

struct PostData: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    
    let title: String
    let url: String?
    let points: Int
    let objectID: String
}
