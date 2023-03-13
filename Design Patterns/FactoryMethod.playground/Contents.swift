import UIKit

protocol Vehicle {
    func drive()
}

class Car: Vehicle {
    func drive() {
        print("drive a car")
    }
}

class Truck: Vehicle {
    func drive() {
        print("drive a truck")
    }
}

class Bus: Vehicle {
    func drive() {
        print("drive a bus")
    }
}

protocol VehicleFactory {
    func produce() -> Vehicle
}

class CarFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Car is created")
        return Car()
    }
}

class TruckFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Truck is created")
        return Truck()
    }
}

class BusFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Bus is created")
        return Bus()
    }
}

let carFactory = CarFactory()
let truckFactory = TruckFactory()
let busFactory = BusFactory()

let car = carFactory.produce()
let truck = truckFactory.produce()
let bus = busFactory.produce()
