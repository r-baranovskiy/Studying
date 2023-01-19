import UIKit

//MARK: - Arrays
/*
 //Filter
 //Создает новый массивя, без элементов, которые не прошли сравнение
 let numsAfter100 = [2, 100, 1337, 90, 153].filter({$0 > 100})
 print(numsAfter100) // [1337, 153]
 
 //Map
 //Создает новый массив модифицируя элементы массива
 let stringArrayFromIntArray = [2, 13, 22, 94].map({String($0)})
 print(stringArrayFromIntArray) // ["2", "13", "22", "94"]
 
 //Reduce
 //Преобразует массив в одно значение;  (0) - начальное значение
 let subtractSumArray = [2, 14, 55, 13].reduce(0) { $0 - $1 }
 print(subtractSumArray) // -84
 
 let allNames = ["Ruslan", "Nastya", "Katya"].reduce(("Anya"), { $0 + ", " + $1 })
 print(allNames) // Anya, Ruslan, Nastya, Katya
 */



//MARK: - Set
/*
 let firstSet: Set = [1, 2, 3, 4]
 let secondSet: Set = [3, 4, 5, 6, 7]
 
 //Intersection
 //Находит общие элементы сравниваемых наборов
 let intersectedSed: Set = firstSet.intersection(secondSet)
 print(intersectedSed) // [3, 4]
 
 //SymmetricDifference
 //Находит элементы, которые не являются общими в сравниваемых наборах
 let symmetricSet: Set = firstSet.symmetricDifference(secondSet)
 print(symmetricSet) // [2, 7, 5, 6, 1]
 
 //Union
 //Находит и объединяет все уникальные элементы сравниваемых наборов
 let unionSet: Set = firstSet.union(secondSet)
 print(unionSet) // [7, 4, 6, 3, 5, 2, 1]
 
 //Subtracting
 //Исключает элементы, которые могут совпадать в сравниваемом наборе
 let subtractedSet: Set = secondSet.subtracting(firstSet)
 print(subtractedSet) // [6, 5, 7]
 
 let thirdSet: Set = [1, 2, 3, 4, 5, 6, 7]
 let fourthSet: Set = [3, 4, 5, 6, 7]
 let fifthSet: Set = [20, 40]
 
 // isSubset(of:) - определяет, что набор является подмножеством сравниваемого набора
 fourthSet.isSubset(of: thirdSet) // true
 
 // isSubset(of:) - определяет, что набор является надмножеством сравниваемого набора
 thirdSet.isSuperset(of: fourthSet) // true
 
 // isDisjoint(with:) определяет, что нет общих значений в сравниваемых наборах
 fifthSet.isDisjoint(with: thirdSet) // true
 */


//MARK: - Data Structures

/*
 struct Resolution {
 var width = 0
 var height = 0
 }
 
 let constantStruct = Resolution()
 //constantStruct.width = 2 // Cannot assign to property: 'constantStruct' is a 'let' constant
 
 var varStruct = Resolution()
 varStruct.width = 2
 print(varStruct.width) // 2
 */




/*
 class Human {
 var name = "Ruslan"
 var surname = "Chaykin"
 }
 
 let constantClass = Human()
 constantClass.name = "Andrey"
 print(constantClass.name) // Andrey
 
 var varClass = Human()
 varClass.name = "Kostya"
 print(varClass.name) // Kostya
 
 varClass = constantClass
 print(varClass.name) //Andrey
 */



//MARK: - Вычисляемые свойства (computed properties) Get and Set

/*
 var property: Type {
 get {
 code
 }
 set(value) {
 code
 }
 }
 */

/*
 struct RentalCar {
 var costPerDay: Double
 
 var costPerWeek: Double {
 get {
 costPerDay * 7.0
 }
 
 set {
 costPerDay = newValue / 7.0
 }
 }
 }
 
 var mazda = RentalCar(costPerDay: 20.0)
 print(mazda.costPerWeek) // 140
 print(mazda.costPerDay) // 20
 
 mazda.costPerDay = 50
 print(mazda.costPerWeek) // 350
 
 mazda.costPerWeek = 140
 print(mazda.costPerWeek) // 140.0
 print(mazda.costPerDay) // 20.0
 */

//MARK: - Наблюдатели свойств willSet и didSet

/*
 class StepCounter {
 var totalSteps: Int = 0 {
 willSet(newTotalSteps) {
 print("Вот-вот значение будет равно \(newTotalSteps)")
 }
 didSet {
 if totalSteps > oldValue  {
 print("Добавлено \(totalSteps - oldValue) шагов")
 }
 }
 }
 }
 let stepCounter = StepCounter()
 stepCounter.totalSteps = 200
 // Вот-вот значение будет равно 200
 // Добавлено 200 шагов
 stepCounter.totalSteps = 360
 // Вот-вот значение будет равно 360
 // Добавлено 160 шагов
 stepCounter.totalSteps = 896
 // Вот-вот значение будет равно 896
 // Добавлено 536 шагов
 */



// MARK: - Type Properties (Свойства типа)

/*
 class SomeClass {
 
 static let someProperty: Int = 10
 
 func someFunc() {
 print(#function)
 }
 
 static func staticFunc() {
 print(#function)
 }
 
 class func classFunc() {
 print(#function)
 }
 
 }
 
 let someClass = SomeClass()
 
 someClass.someFunc() // someFunc()
 
 SomeClass.staticFunc() // staticFunc()
 
 SomeClass.classFunc() // classFunc()
 
 print(SomeClass.someProperty) // 10
 */

// MARK: - Object-oriented programming (ООП)
/*
 
 class Vehicle {
 var currentSpeed = 0.0
 var description: String {
 return "\(currentSpeed) км/ч"
 }
 }
 
 class Car: Vehicle {
 var gear = 1
 
 override var description: String {
 return super.description + " in gear \(gear)"
 }
 }
 
 class AutomaticCar: Car {
 override var currentSpeed: Double {
 didSet {
 gear = Int(currentSpeed / 10.0) + 1
 }
 }
 }
 
 let automaticCar = AutomaticCar()
 automaticCar.currentSpeed = 35.0
 print(automaticCar.currentSpeed) // 35.0
 print(automaticCar.gear) // 4
 print("AutomaticCar: \(automaticCar.description)") // AutomaticCar: 35.0 км/ч in gear 4
 
 private func getImages(imagesStrings: String...) -> [UIImage] {
 var imagesArray = [UIImage]()
 for imageString in imagesStrings {
 if let image = UIImage(named: imageString) {
 imagesArray.append(image)
 }
 }
 return imagesArray
 }
 */



// MARK: - Any & AnyObject

// Any - Любой тип     AnyObject - Любой ссылочный тип (класс)

/*
 var things: [Any] = []
 
 things.append(3)
 things.append("Ruslan")
 things.append({ (name: String) -> String in "Hello \(name)" })
 
 print(things) // [3, "Ruslan", (Function)]
 
 
 // Is - Проверка элемента на тип
 
 for item in things {
 if item is String {
 print(item) // "Ruslan"
 } else if item is Int {
 print(item) // 3
 }
 }
 
 // As - Преборазование элемента в нужный тип
 
 for item in things {
 if let someString = item as? String {
 print(someString) // "Ruslan"
 }
 }
 
 // Crash
 //let someString = things[0] as! String
 //print(someString)
 */



// MARK: - Extension

/*
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

let numbers = [1, -4, 0, 2]

for number in numbers {
    switch number.kind {
    case .negative:
        print("\(number) is negative")
    case .zero:
        print("\(number) is zero")
    case .positive:
        print("\(number) is positive")
    }
} // 1 is positive, -4 is negative, 0 is zero, 2 is positive
*/
