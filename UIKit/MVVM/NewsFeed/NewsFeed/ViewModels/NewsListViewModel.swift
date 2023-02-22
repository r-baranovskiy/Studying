import Foundation

final class NewsListViewModel {
    let articles: [Article]
    
    init(articles: [Article]) {
        self.articles = articles
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRowsInSection: Int {
        print(articles.count)
        return articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article: article)
    }
}
