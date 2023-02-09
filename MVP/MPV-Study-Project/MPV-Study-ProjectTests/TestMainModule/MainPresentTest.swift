//
//  MainPresentTest.swift
//  MPV-Study-ProjectTests
//
//  Created by Кащенко on 9.02.23.
//

import XCTest
@testable import MPV_Study_Project

class MockView: MainViewProtocol {
    var titleTest: String?
    func setGreeting(greeting: String) {
        titleTest = greeting
    }
    
    
}

final class MainPresentTest: XCTestCase {
    
    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!

    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Baz", secondName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }
    
    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "view isn't nil")
        XCTAssertNotNil(person, "person isn't nil")
        XCTAssertNotNil(presenter, "presenter isn't nil")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.secondName, "Bar")
    }
}
