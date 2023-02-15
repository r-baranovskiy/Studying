import Foundation

// Output
protocol MainViewProtocol: AnyObject {
    func success()
    func failture(error: Error)
}

// Imput
protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkManager)
    func getComments()
    var comments: [Comment]? { get set }
}

final class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    var comments: [Comment]?
    let networkService: NetworkManager
    
    required init(view: MainViewProtocol, networkService: NetworkManager) {
        self.view = view
        self.networkService = networkService
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failture(error: error)
                }
            }
        }
    }
}
