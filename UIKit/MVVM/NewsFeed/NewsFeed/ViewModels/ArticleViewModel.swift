import Foundation

final class ArticleViewModel {
    private let article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var title: String {
        return article.title
    }
    
    var description: String {
        return article.description
    }
}
