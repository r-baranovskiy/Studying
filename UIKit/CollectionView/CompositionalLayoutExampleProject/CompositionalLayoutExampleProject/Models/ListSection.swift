import Foundation

enum ListSection {
    case sales([ListItem])
    case categories([ListItem])
    case example([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .sales(let items),
                .categories(let items),
                .example(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .sales(_):
            return ""
        case .categories(_):
            return "Category"
        case .example(_):
            return "Example"
        }
    }
}
