import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol {
    init(view: DetailViewProtocol, networkService: NetworkManagerProtocol, comment: Comment?)
    func setComment()
}

final class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networkService: NetworkManagerProtocol
    var comment: Comment?
    
    init(view: DetailViewProtocol, networkService: NetworkManagerProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    func setComment() {
        self.view?.setComment(comment: comment)
    }
}
