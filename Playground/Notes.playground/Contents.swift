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

// Inheritance (Наследование)


