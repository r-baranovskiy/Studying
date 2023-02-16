import UIKit

enum CarType {
    case huge
    case fast
}

protocol Car {
    func drive()
}

class HugeCar: Car {
    
    func drive() {
        print("you drive a huge car")
    }
}

class FastCar: Car {
    
    func drive() {
        print("you drive a fast car")
    }
}



class CarFactory {
    
    static func produceCar(type: CarType) -> Car {
        var car: Car
        
        switch type {
        case .fast:
            car = FastCar()
        case .huge:
            car = HugeCar()
        }
        
        return car
    }
}

let hugeCar = CarFactory.produceCar(type: .huge)
let fastCar = CarFactory.produceCar(type: .fast)
