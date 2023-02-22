//
//  ModuleBuilder.swift
//  MPV-Study-Project
//
//  Created by Кащенко on 8.02.23.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailViewModule(comment: Comment?) -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkManager()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailViewModule(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkManager()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
}
