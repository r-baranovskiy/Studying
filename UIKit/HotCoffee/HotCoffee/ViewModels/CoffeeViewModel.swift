import Foundation

final class CoffeeViewModel {
    
    var ordersViewModel: [OrderViewModel]
    
    init(ordersViewModel: [OrderViewModel]) {
        self.ordersViewModel = ordersViewModel
    }
    
    func orderViewModel(at index: Int) -> OrderViewModel {
        return ordersViewModel[index]
    }
    
}
