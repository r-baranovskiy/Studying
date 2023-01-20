import UIKit

// MARK: - Perfomance Measure

func perfomanceMeasure(block: () -> Void) -> Double {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    return timeInterval
}



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



// MARK: - На днях я видел потрясающее видео, где парень взломал несколько лампочек, управляемых через Wi-Fi, пролетев мимо них на дроне. Блестящий. В этом ката мы воссоздадим этот трюк... вроде того. Вам дадут две строки: lamps и drone. lamps представляет собой ряд выключенных ламп, каждая из которых представлена x. Когда эти лампы включены, они должны быть представлены o. Строка drone представляет собой положение дрона T (есть ли лучшее предложение для персонажа??) и траекторию его полета до этой точки =. Дрон всегда летит слева направо и всегда начинается в начале ряда фонарей. Куда бы ни летел дрон, включая его текущее положение, это приведет к включению лампы в этом положении. Верните получившуюся строку ламп. См. примеры тестов для большей ясности.

//func basicTests() {
//    XCTAssertEqual(flyBy(lamps: "xxxxxx", drone: "====T"), "ooooox")
//    XCTAssertEqual(flyBy(lamps: "xxxxxxxxx", drone: "==T"), "oooxxxxxx")
//    XCTAssertEqual(flyBy(lamps: "xxxxxxxxxxxxxxx", drone: "=========T"), "ooooooooooxxxxx")
//}

/*
 
 // V1
 func flyBy(lamps: String, drone: String) -> String {
 return lamps.replacingOccurrences(of: "x", with: "o", range: drone.startIndex..<drone.endIndex)
 }
 
 // V2
 func flyByV2( lamps: String, drone: String) -> String {
 String(repeating: "o", count: drone.count) + String(repeating: "x", count: (lamps.count - drone.count))
 }
 
 */



// MARK: - Вы получаете массив чисел, возвращаете сумму всех положительных.
// Пример [1,-4,7,12] => 1 + 7 + 12 = 20 Примечание: если суммировать нечего, сумма по умолчанию равна 0.

/*
 
 // V1
 func sumOfPositives (_ numbers: [Int] ) -> Int {
 numbers.filter({ $0 > 0 }).reduce((0), { $0 + $1} )
 }
 
 // V2
 func sumOfPositivesV2 (_ numbers: [Int] ) -> Int {
 
 var result: Int = 0
 
 for number in numbers where number > 0 {
 result += number
 }
 return result > 0 ? result : 0
 }
 
 */



// MARK: - Завершите решение так, чтобы оно перевернуло переданную в него строку.
// 'world'  =>  'dlrow', 'word'   =>  'drow'

/*
 
 // V1
 func reverse(_ str: String) -> String {
 str.reversed().reduce((""), { $0 + String($1) })
 }
 
 // V2
 func reverseV2(_ str: String) -> String {
 return String(str.reversed())
 }
 
 */



// MARK: - Очень просто, по заданному целому числу или числу с плавающей запятой найти его противоположность. Примеры:
// 1: -1,  14: -14,  -34: 34

/*
 
 // V1
 func opposite(number: Double) -> Double {
 -number
 }
 
 // V2
 func oppositeV2(number: Double) -> Double {
 number * -1
 }
 
 */



// MARK: - Завершите функцию квадратной суммы, чтобы она возводила в квадрат каждое переданное ей число, а затем суммировала результаты.
// Например, для [1, 2, 2] он должен вернуть 9, потому что 1^2 + 2^2 + 2^2 = 9.

/*
 
 // V1
 func squareSum(_ vals: [Int]) -> Int {
 var sum = Int()
 
 for num in vals {
 sum += num * num
 }
 
 return sum
 }
 
 // V2
 
 func squareSumV2(_ vals:[Int]) -> Int {
 vals.map{ $0 * $0 }.reduce(0, +)
 }
 
 */



// MARK: - Создайте функцию, которая проверяет, делится ли число n на два числа x И y. Все входные данные являются положительными, ненулевыми числами.

/*
 
 // V1
 func isDivisible(_ n: Int, _ x: Int, _ y: Int) -> Bool {
 n.isMultiple(of: x) && n.isMultiple(of: y)
 }
 
 // V2
 func isDivisibleV2(_ n: Int, _ x: Int, _ y: Int) -> Bool {
 return n % x == 0 && n % y == 0
 }
 
 */



// MARK: - Преобразовать число в перевернутый массив цифр Учитывая случайное неотрицательное число, вы должны вернуть цифры этого числа в массиве в обратном порядке.

// 35231 => [1,3,2,5,3]    0 => [0]

/*
 
 // V1
 func digitize(_ num:Int) -> [Int] {
 var emptyStringArray = [String]()
 let numString = String(num)
 
 numString.forEach({ emptyStringArray.append(String($0)) })
 emptyStringArray.reverse()
 
 return emptyStringArray.map({ Int($0) ?? 0 })
 }
 
 // V2
 func digitizeV2(_ num: Int) -> [Int] {
 guard num > 0 else {
 return [0]
 }
 var result: [Int] = []
 var i = num
 while i != 0 {
 result.append(i % 10)
 i /= 10
 }
 return result
 }
 
 */



// MARK: - Вам будет дан массив a и значение x. Все, что вам нужно сделать, это проверить, содержит ли предоставленный массив значение. Тип a и x может быть String или Int. Возвращает true, если массив содержит значение, и false, если нет.

//static let exampleStringTests = [
//    (["t", "e", "s", "t"], "e" , true),
//    (["what", "a", "great", "kata"], "kat" , false)
//]

/*
 
 // V1
 func check<T: Equatable>(_ a: [T], _ x: T) -> Bool {
 return a.contains(x)
 }
 
 */



// MARK: - Учитывая строку цифр, вы должны заменить любую цифру ниже 5 на «0», а любую цифру 5 и выше на «1». Верните полученную строку. Примечание: ввод никогда не будет пустой строкой

/*
 
 // V1
 func fakeBin(digits: String) -> String {
 
 digits.reduce((""), { $0 + String($1.wholeNumberValue ?? 0 < 5 ? "0" : "1") })
 }
 
 // V2
 func fakeBinV2(digits: String) -> String {
 return digits.map({ $0 < "5" ? "0" : "1" }).joined()
 }
 
 */



// MARK: - Создайте функцию, которая возвращает массив целых чисел от n до 1, где n>0.
// Пример: n=5 --> [5,4,3,2,1]

/*
 
 // V1
 func reverseSeq(n: Int) -> [Int] {
 var n = n
 var array = [Int]()
 
 while n > 0 {
 array.append(n)
 n -= 1
 }
 return array
 }
 
 // V2
 func reverseSeqV2(n: Int) -> [Int] {
 return (1...n).reversed()
 }
 
 */



// MARK: - Конец учебного года, судьбоносный момент твоего школьного отчета. Средние значения должны быть рассчитаны. Все ученики подходят к вам и умоляют вас подсчитать для них их средний балл. Легкий ! Вам просто нужно написать сценарий. Возвращает среднее значение данного массива, округленное до ближайшего целого числа. Массив никогда не будет пустым.

/*
 
 // V1
 func getAverage(_ marks: [Int]) -> Int {
 return marks.reduce(0, +) / marks.count
 }
 
 */



// MARK: - Вы ведете своего сына в лес, чтобы увидеть обезьян. Вы знаете, что там есть определенное число (n), но ваш сын слишком мал, чтобы просто оценить полное число, ему приходится начинать считать их с 1. Как хороший родитель, вы будете сидеть и считать с ним. Учитывая число (n), заполните массив всеми числами до этого числа включительно, но исключая ноль.

// For example(Input --> Output):

//10 --> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// 1 --> [1]

/*
 
 func monkeyCount(_ n: Int) -> [Int] {
 Array(1...n)
 }
 
 */



// MARK: - После тяжелой четверти в офисе вы решаете немного отдохнуть в отпуске. Итак, вы забронируете рейс для себя и своей девушки и постараетесь оставить весь беспорядок позади. Вам понадобится арендованный автомобиль, чтобы передвигаться в отпуске. Менеджер по аренде автомобилей делает вам несколько хороших предложений. Каждый день аренды автомобиля стоит 40 долларов. Если вы арендуете автомобиль на 7 или более дней, вы получаете скидку в размере 50 долларов США. В качестве альтернативы, если вы арендуете автомобиль на 3 или более дней, вы получаете скидку в размере 20 долларов США. Напишите код, который выдает общую сумму за разные дни (d).

/*

// V1
func RentalCarCost(_ days: Int) -> Int {
    var cost = 0
    
    if days >= 3 && days < 7 {
        cost = days * 40 - 20
    } else if days >= 7 {
        cost = days * 40 - 50
    } else {
        cost = days * 40
    }
    
    return cost
}

// V2

func RentalCarCostV2(_ days: Int) -> Int {
  return days * 40 - (days >= 3 ? ( days >= 7 ? 50 : 20 ) : 0)
}

*/









// MARK: - Execution

//let executionTime = perfomanceMeasure {
//    print("hello")
//}
//
//let executionTime2 = perfomanceMeasure {
//    print("hello")
//}
//
//print("Execution time: \(executionTime) seconds")
//print("Execution time: \(executionTime2) seconds")


