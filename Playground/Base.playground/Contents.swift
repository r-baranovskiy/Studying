import UIKit

//MARK: - Arrays

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




//MARK: - Set

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
