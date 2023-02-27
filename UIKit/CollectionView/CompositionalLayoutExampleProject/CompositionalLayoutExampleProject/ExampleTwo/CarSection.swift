import Foundation

enum CarSection {
    case sales([CarItem])
    case brands([CarItem])
    case hotOffer([CarItem])
    
    var cars: [CarItem] {
        switch self {
        case .sales(let cars), .brands(let cars), .hotOffer(let cars):
            return cars
        }
    }
    
    var count: Int {
        return cars.count
    }
    
    var title: String {
        switch self {
        case .sales(_):
            return "Sales"
        case .brands(_):
            return "Brands"
        case .hotOffer(_):
            return "Hot offer"
        }
    }
}
