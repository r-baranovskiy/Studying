import UIKit

//MARK: - Functions

//Генератор имени с дефолтным параметром и заменой заглавной буквы на нижний регистр
func generateHandle(name: String, anotherWord: String = "lol") -> String {
    name.lowercased() + anotherWord
}

//Перегрузка функций
func compareTwoNumber(more firstNumber: Int, less secondNumber: Int) -> Bool {
    firstNumber > secondNumber
}

func compareTwoNumber(less firstNumber: Int, more secondNumber: Int) -> Bool {
    firstNumber < secondNumber
}

compareTwoNumber(less: 10, more: 20) //True
compareTwoNumber(less: 20, more: 10) //False
compareTwoNumber(more: 20, less: 10) //True
compareTwoNumber(more: 10, less: 20) //False

//Stride
for step in stride(from: 10, to: 50, by: +10) {
    print(step) //4 times
}

for step in stride(from: 10, through: 50, by: +10) {
    print(step) //5 times
}

//Функции с вариативными параметрами (Могут принимать несколько параметров)
func getMaxNumber(for numbers: Int...) -> Int {
    numbers.max() ?? 0
}

let maxNumber = getMaxNumber(for: 1, 14, 22, 1337, 1993) //1993

//Функция с изменяемым параметром inout
var count = 2

func multiplyToSelf(_ value: inout Int) {
    value *= value
    print(value)
}

multiplyToSelf(&count) //4
multiplyToSelf(&count) //16
multiplyToSelf(&count) //256

var score = 0

func addScore(score: inout Int, points: Int) {
    score += points
}

addScore(score: &score, points: 300)
print(score) //300

//Функция как параметр

func add(numOne: Int, numTwo: Int) -> Int {
    numOne + numTwo
}

var functionAdd = add
functionAdd(13, 37) // 50

func subtract(numOne: Int, numTwo: Int) -> Int {
    numOne - numTwo
}

var functionSubtract = subtract
functionSubtract(1337, 1300) //37

func result(_ operate: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = operate(a, b)
    print(result)
}

//Передаю в параметры функции замыкание
result(functionAdd, 28, 12) //40
result(functionSubtract, 100, 99) //1

//Создаем псевдоним типа и переносим туда замыкание
typealias Operate = (Int, Int) -> Int

func printResult(_ operate: Operate, _ a: Int, _ b: Int) {
    print(operate(a, b))
}

printResult(functionSubtract, 1998, 98) //1900

