import Foundation

final class OrderViewModel {
    let order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return order.name
    }
    
    var email: String {
        return order.email
    }
    
    var type: String {
        return order.type.rawValue.capitalized
    }
    
    var size: String {
        return order.size.rawValue.capitalized
    }
}
