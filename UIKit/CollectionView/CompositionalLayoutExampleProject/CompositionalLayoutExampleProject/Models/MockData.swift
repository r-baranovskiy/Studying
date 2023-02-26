import Foundation

struct MockData {
    
    static let shared = MockData()
    
    private let sales: ListSection = {
        .sales([
            .init(title: "", imageString: "salesBurgerOne"),
            .init(title: "", imageString: "salesBurgerTwo"),
            .init(title: "", imageString: "salesBurgerThree")
        ])
    }()
    
    private let categories: ListSection = {
        .categories([
            .init(title: "Burger", imageString: "categoryBurger"),
            .init(title: "Pizza", imageString: "categoryPizza"),
            .init(title: "Taco", imageString: "categoryTaco"),
            .init(title: "Sushi", imageString: "categorySushi"),
            .init(title: "Dessert", imageString: "categoryDessert"),
            .init(title: "Shawarma", imageString: "categoryShawarma")
        ])
    }()
    
    private let examples: ListSection = {
        .example([
            .init(title: "", imageString: "exampleOne"),
            .init(title: "", imageString: "exampleTwo"),
            .init(title: "", imageString: "exampleThree")
        ])
    }()
    
    var pageData: [ListSection] {
        [sales, categories, examples]
    }
}
