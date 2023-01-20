import UIKit


// MARK: - Суммирование Напишите программу, которая находит сумму всех чисел от 1 до num. Число всегда будет положительным целым числом больше 0. Например (Input -> Output):

// 2 -> 3 (1 + 2)
// 8 -> 36 (1 + 2 + 3 + 4 + 5 + 6 + 7 + 8)

/*

// V1
func summation(_ n: Int) -> Int {
    var sum = 0
    
    for num in 1...n {
        sum += num
    }
    
    return sum
}

// V2
func summationV2(_ n: Int) -> Int {
    (0...n).reduce(0, +)
}

*/

// MARK: - Учитывая массив целых чисел в виде строк и чисел, верните сумму значений массива, как если бы все они были числами. Верните ответ в виде числа.

/*

// V1
func sumMix(_ arr: [Any]) -> Int {
    var sum = 0
    
    for anyElement in arr {
        if let intElement = anyElement as? Int {
            sum += intElement
        } else if let stringElement = anyElement as? String {
            sum += Int(stringElement) ?? 0
        }
    }
    
    return sum
}

sumMix([15, 90, 2, "fdsfdsa"])

// V2
func sumMixV2(_ arr: [Any]) -> Int {
    return arr.reduce(0) { $0 + (Int("\($1)") ?? 0) }
}

*/
