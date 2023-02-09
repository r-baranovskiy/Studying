//
//  ModuleBuilder.swift
//  MPV-Study-Project
//
//  Created by Кащенко on 8.02.23.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "Ruslan", secondName: "Kashchenko")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
}
