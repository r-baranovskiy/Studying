//
//  MainPresenter.swift
//  MPV-Study-Project
//
//  Created by Кащенко on 8.02.23.
//

import Foundation

// Output
protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

// Imput
protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.secondName
        self.view.setGreeting(greeting: greeting)
    }
}
