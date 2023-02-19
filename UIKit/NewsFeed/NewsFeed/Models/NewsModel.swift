import Foundation

struct News: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String
}
