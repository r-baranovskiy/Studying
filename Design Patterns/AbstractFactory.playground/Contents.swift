import UIKit

protocol Car {
    func drive()
}

class LittleSizeCar: Car {
    func drive() {
        print("drive a little size car")
    }
}

class MiddleSizeCar: Car {
    func drive() {
        print("drive a middle size car")
    }
}

protocol Bus {
    func drive()
}

class LittleSizeBus: Bus {
    func drive() {
        print("drive a little size bus")
    }
}

class MiddleSizeBus: Bus {
    func drive() {
        print("drive a middle size bus")
    }
}


protocol Factory {
    func produceBus() -> Bus
    func produceCar() -> Car
}

class LittleSizeFactory: Factory {
    func produceBus() -> Bus {
        return LittleSizeBus()
    }
    
    func produceCar() -> Car {
        LittleSizeCar()
    }
}

class MiddleSizeFactory: Factory {
    func produceBus() -> Bus {
        return MiddleSizeBus()
    }
    
    func produceCar() -> Car {
        MiddleSizeCar()
    }
}

let middleFactory = MiddleSizeFactory()
let middleCar = middleFactory.produceCar()
middleCar.drive() // drive a middle size car
