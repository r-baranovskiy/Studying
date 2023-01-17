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
 Могут определять свойства и методы.
 Могут определять сабскрипты.
 Могут определить инициализаторы с помощью функции init().
 Могут использовать расширения.
 Могут соответствовать протоколам.
 */


//Class type: Reference

/*
 Классы могут наследоваться от другого класса.
 Классы могут содержать деинициализаторы.
 Классы являются ссылочными типами, а структуры являются значимыми типами.
 Преобразование типов позволяет проверить и должным образом интерпретировать тип класса во время выполнения программы
 
 Когда стоит использовать классы?
 Рекомендуется использовать класс, если вам нужны его характерные особенности. Как отмечалось ранее, у классов есть несколько дополнительных характеристик, которых нет у структур:
 
 Классы могут наследоваться друг от друга.
 Классы могут быть деинициализированы.
 Классы поставляются со встроенным понятием идентичности , потому что они являются ссылочными типами. С помощью оператора идентичности === вы можете проверить, ссылаются ли два экземпляра класса на один и тот же объект.
 Рядом со ссылочным типом значений наследование является наиболее важным различием между классом и структурой. С помощью классов вы можете четко определить родительско-дочернюю связь между подклассом и суперклассом.
 */


//Struct type: Value
/*
 Когда стоит использовать структуры?
 По умолчанию рекомендуется использовать структуры. Структуры также полезны в следующих сценариях:
 
 Используйте структуры для простых типов данных. Воспринимайте их как простые базы данных, которые вы можете использовать в своем коде, например NewsItem, Task или User. Поскольку они четко определены и часто не нуждаются в сложных отношениях между объектами.
 В многопоточной среде, например, с подключением к базе данных в другом потоке, структуры более безопасны. и могут быть безопасно скопированы из одного потока в другой. Классы не имеют присущей им безопасности, если только они не намеренно сделаны поточно-ориентированными.
 Когда свойства структуры в основном являются значимыми типами, например String, имеет смысл обернуть их в структуру вместо класса.
 Использование структур имеет дополнительное преимущество: вам проще анализировать изменения данных в вашем коде. Когда тип является структурой, вы можете быть уверены, что никакая другая часть вашего кода не сможет удерживать ссылку на объект. То есть структура не может быть изменена какой-либо другой частью вашего кода.
 */



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
 Свойство:
 
 Свойство связано с именем переменной или константы и является частью класса, структуры или перечисления.
 Хранимые свойства представляют простейшую форму хранения значений в виде констант или переменных. Они имеют значение по умолчанию или получают его с помощью инициализатора.
 */

/*
 Вычисляемое свойство — это свойство, которое вычисляет и возвращает значение, а не просто его хранит.
 Свойство связано с именем переменной или константы и является частью класса, структуры или перечисления.
 Хранимые свойства представляют простейшую форму хранения значений в виде констант или переменных. Они имеют значение по умолчанию или получают его с помощью инициализатора.
 */

/*
 Геттеры и сеттеры для вычисляемых свойств:
 
 Вычисляемые свойства могут также могут использовать геттер (get) и сеттер (set):

 Геттер выполняется при получении значения свойства.
 Сеттер выполняется при установке нового значения свойства.
 */

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
 Наблюдатели свойств willSet  и didSet вызываются тогда, когда кто-то устанавливает это свойство.
 Наблюдатель willSet вызывается непосредственно перед тем, как свойство будет установлено, и внутри наблюдателя можно использовать специальную переменную с именем newValue.
 Наблюдатель didSet вызывается сразу после получения свойством значения, и внутри можно использовать специальную переменную с именем oldValue.
 
 Наблюдатели также могут быть установлены и на наследуемые свойства. В этом случае выполняются все наблюдатели: и унаследованного свойства и у свойства super-класса.
 Это очень удобно в случае, если вы не хотите менять свойств super-класса напрямую, но хотите знать когда они меняются.
 
 override var inheritedProperty {
     willSet {newValue - имя переменной, которую Swift создал для нас, в которой хранится значение, которое будет установлено}
     didSet {oldValue - имя переменной, которую Swift создал для нас, в которой хранится значение, которое было установлено до замены}
 }
 
 
 willSet вызывается прямо перед сохранением значения!
 didSet вызывается сразу после сохранения значения!
 
 Если вы реализуете наблюдатель willSet, то он передает новое значение свойства как константный параметр.
 Вы можете сами определить ему имя внутри реализации willSet. Если вы не станете указывать новое имя параметра и скобки внутри реализации, то параметр все равно будет доступен через имя параметра по умолчанию newValue.

 Аналогично, если вы реализуете наблюдатель didSet, то ему будет передан параметр-константа, содержащий старое значение свойства. Вы можете задать имя параметру, но если вы этого не сделаете, то он все равно будет доступен через имя параметра по умолчанию oldValue.
 
 */

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

// Static Позволяет обращаться к методу/свойству класса/структуры без инициализации самого класса

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

/*
 Концепция объектно-ориентированного программирования, согласно которой абстрактный тип данных может наследовать данные и функциональность некоторого существующего типа, способствуя повторному использованию компонентов программного обеспечения
 
 
 */
