import UIKit

// MARK: - Найдите сумму внутренних углов (в градусах) n-стороннего простого многоугольника. N будет больше 2.

/*
 
 func angle(_ n: Int) -> Int {
 180 * (n - 2)
 }
 
 */



// MARK: - Тролли атакуют ваш раздел комментариев! Обычный способ справиться с этой ситуацией — удалить все гласные из комментариев троллей, нейтрализуя угрозу. Ваша задача — написать функцию, которая принимает строку и возвращает новую строку, в которой удалены все гласные. Например, строка «Этот сайт для неудачников, LOL!» станет «Ths wbst s fr lsrs LL!». Примечание: для этой ката y не считается гласной.

/*
 
 // V1
 func disemvowel(_ s: String) -> String {
 var disemvoweledString = ""
 
 for char in s {
 if char != "e" && char != "u" && char != "i" && char != "o" && char != "a" && char != "E" && char != "U" && char != "I" && char != "O" && char != "A"{
 disemvoweledString.append(char)
 print(char)
 }
 }
 
 return disemvoweledString
 }
 
 // V2
 func disemvowelV2(_ s: String) -> String {
 return s.replacingOccurrences(of: "[aeiou]", with: "", options: [.regularExpression, .caseInsensitive])
 }
 
 */

// MARK: - Добро пожаловать. В этой ката вас просят возвести в квадрат каждую цифру числа и соединить их. Например, если мы пропустим через функцию 9119, получится 811181, потому что 92 — это 81, а 12 — это 1. (81-1-1-81).
//Пример #2: Ввод 765 будет/должен вернуть 493625, потому что 72 равно 49, 62 равно 36, а 52 равно 25. (49-36-35) Примечание.
//Функция принимает целое число и возвращает целое число. Удачного кодирования!

/*
 
 // V1
 func squareDigits(_ num: Int) -> Int {
 var resultString = String(num)
 var squareArray = [Int]()
 for str in resultString {
 squareArray.append(Int(pow(Double(str.wholeNumberValue ?? 0), 2)))
 }
 
 resultString = ""
 
 for int in squareArray {
 resultString.append(String(int))
 }
 
 return Int(resultString) ?? 0
 }
 
 // V2
 func squareDigitsV2(_ num: Int) -> Int {
 Int("\(num)".compactMap { Int("\($0)") }.map { "\($0 * $0)" }.joined()) ?? 0
 }
 
 */



// MARK: - Ваша задача состоит в том, чтобы создать функцию, которая может принимать любое неотрицательное целое число в качестве аргумента и возвращать его с цифрами в порядке убывания. По сути, переставьте цифры, чтобы получить максимально возможное число.

//Examples:
//Input: 42145 Output: 54421
//
//Input: 145263 Output: 654321
//
//Input: 123456789 Output: 987654321

/*
 
 func descendingOrder(of number: Int) -> Int {
 
 let str = String(number).compactMap({ $0.wholeNumberValue }).sorted(by: { $0 > $1 }).reduce((""), { String($0) + String($1) })
 
 return Int(str) ?? 0
 }
 */



// MARK: - На этот раз ни истории, ни теории. В приведенных ниже примерах показано, как написать функцию accum:

//accum("abcd") -> "A-Bb-Ccc-Dddd" accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Ttttt-Yyyyyyy" accum("cwAt") -> "C-Ww-Aaa-Tttt"
//Параметр accum представляет собой строку, включающую только буквы из a..z и A..Z.

/*
 
 func accum(_ s: String) -> String {
 var str = String()
 
 for (index, char) in s.enumerated() {
 str += "\(char)".uppercased() + String(repeating: "\(char)".lowercased(), count: index) + "-"
 }
 
 str.removeLast()
 return str
 }
 
 func accumV2(_ str: String) -> String {
 return str.enumerated().map {
 repeatElement(String($1), count: $0 + 1)
 .joined()
 .capitalized
 }
 .joined(separator: "-")
 }
 
 func accumV3(_ str: String) -> String {
 return str.enumerated().map {
 String(repeating: $1, count: $0 + 1).capitalized
 }.joined(separator: "-")
 }
 
 */



// MARK: - Просто, учитывая строку слов, вернуть длину кратчайшего слова (слов). Строка никогда не будет пустой, и вам не нужно учитывать разные типы данных.

/*
 
 // V1
 func find_short(_ str: String) -> Int {
 let arr = str.split(separator: " ")
 return arr.compactMap({ $0.count }).sorted(by: { $0 < $1 }).first ?? 0
 }
 
 find_short("Hello my name is Ruslan")
 
 // V2
 func find_shortV2(_ str: String) -> Int
 {
 return str.components(separatedBy: " ").map { $0.count }.min() ?? 0
 }
 
 */



// MARK: - Джейден Смит, сын Уилла Смита, является звездой таких фильмов, как «Каратэ-пацан» (2010) и «После Земли» (2013). Джейден также известен своей философией, которую он распространяет через Twitter. Когда он пишет в Твиттере, он известен тем, что почти всегда пишет каждое слово с большой буквы. Для простоты вам придется писать каждое слово с заглавной буквы. Посмотрите, какими должны быть сокращения в приведенном ниже примере. Ваша задача состоит в том, чтобы преобразовать строки в то, как они были бы написаны Джейденом Смитом. Строки являются настоящими цитатами Джейдена Смита, но они не написаны с заглавной буквы так, как он их изначально напечатал.

//Example:
//
//Not Jaden-Cased: "How can mirrors be real if our eyes aren't real"
//Jaden-Cased:     "How Can Mirrors Be Real If Our Eyes Aren't Real"

/*
 
 extension String {
 
 func toJadenCase() -> String {
 String(split(separator: " ").map({ $0.capitalized }).reduce((""), { $0 + " " + $1 }).dropFirst())
 }
 }
 
 extension String {
 func toJadenCaseV2() -> String {
 return capitalized
 }
 }
 
 */



// MARK: - Обычно, когда вы что-то покупаете, вас спрашивают, верны ли номер вашей кредитной карты, номер телефона или ответ на ваш самый секретный вопрос. Однако, поскольку кто-то может заглянуть вам через плечо, вы не хотите, чтобы это отображалось на вашем экране. Вместо этого мы маскируем его. Ваша задача — написать функцию maskify, которая заменяет все символы, кроме последних четырех, на «#».

//Examples
//"4556364607935616" --> "############5616"
//     "64607935616" -->      "#######5616"
//               "1" -->                "1"
//                "" -->                 ""
//
//// "What was the name of your first pet?"
//
//"Skippy" --> "##ippy"
//
//"Nananananananananananananananana Batman!"
//-->
//"####################################man!"

/*
 
 // V1
 func maskify(_ string: String) -> String {
 var str = String()
 
 for (index, ch) in string.enumerated() {
 if index < string.count - 4 {
 str.append("#")
 } else {
 str.append(ch)
 }
 }
 return str
 }
 
 // V2
 import Foundation
 
 func maskifyV2(_ string:String) -> String {
 string.enumerated().map { $0 < string.count - 4 ? "#" : "\($1)"}.joined()
 }
 
 */



// MARK: - Создайте функцию, которая возвращает сумму двух наименьших положительных чисел для заданного массива минимум из 4 положительных целых чисел. Не будут переданы числа с плавающей запятой или неположительные целые числа. Например, когда массив передается как [19, 5, 42, 2, 77], вывод должен быть 7.

//[10, 343445353, 3453445, 3453545353453] должен вернуть 3453455.

/*
 
 // V1
 func sumOfTwoSmallestIntegersIn(_ array: [Int]) -> Int {
 let sortedArray = array.sorted()
 
 return sortedArray[0] + sortedArray[1]
 }
 
 // V2
 func sumOfTwoSmallestIntegersInV2(_ array: [Int]) -> Int {
 return array.sorted()[0...1].reduce(0, +)
 }
 
 */

// MARK: - На заводе принтер печатает этикетки для коробок. Для одного вида коробок принтеру приходится использовать цвета, которые для простоты обозначаются буквами от а до m. Цвета, используемые принтером, записываются в управляющую строку. Например, "good" контрольной строкой будет aaabbbbhaijjjm, что означает, что принтер использовал три раза цвет a, четыре раза цвет b, один раз цвет h, а затем один раз цвет a... Иногда возникают проблемы: отсутствие цветов, технический сбой и выдается "bad" управляющая строка, например. aaaxbbbbyyhwawiwjjjwwm с буквами не от a до m. Вы должны написать функцию printer_error, которая по заданной строке будет возвращать частоту ошибок принтера в виде строки, представляющей рациональное число, числитель которого — количество ошибок, а знаменатель — длина управляющей строки. Не уменьшайте эту дробь до более простого выражения. Строка имеет длину больше или равную единице и содержит только буквы от a до z.

//Examples:
//s="aaabbbbhaijjjm"
//printer_error(s) => "0/14"
//
//s="aaaxbbbbyyhwawiwjjjwwm"
//printer_error(s) => "8/22"

/*
 
 func printerError(_ s: String) -> String {
 let errors = s.filter { !"abcdefghijklm".contains($0)  }
 return "\(errors.count)/\(s.count)"
 }
 
 */

// MARK: - Дан треугольник последовательных нечетных чисел. Вычислите сумму чисел в n-й строке этого треугольника (начиная с индекса 1), например: (Ввод --> Вывод)

//1
//3     5
//7     9    11
//13    15    17    19
//21    23    25    27    29

//1 -->  1
//2 --> 3 + 5 = 8

/*
 
 // V1
 func rowSumOddNumbers(_ row: Int) -> Int {
 let startNumber = (row * (row - 1)) + 1  // 7
 let endNumber = startNumber + (row - 1) * 2 // 11
 let sum = (startNumber + endNumber) * row / 2 // 27
 return sum
 }
 
 // V2
 func rowSumOddNumbersV2(_ row: Int) -> Int {
 return row * row * row
 }
 
 */

// MARK: - Не ставь мне пять! В этом ката вы получаете начальный номер и конечный номер региона и должны вернуть количество всех чисел, кроме номеров с 5 в нем. Начальный и конечный номер включительно! Результат может содержать пятерки. ;-) Начальный номер всегда будет меньше конечного. Оба числа могут быть и отрицательными!

//Examples:
//
//1,9 -> 1,2,3,4,6,7,8,9 -> Result 8
//4,17 -> 4,6,7,8,9,10,11,12,13,14,16,17 -> Result 12

/*
 
 func dontGiveMeFive(_ start: Int, _ end: Int) -> Int {
 Array(start...end).filter({!String($0).contains("5")}).count
 }
 
 */



// MARK: -  Подсчитайте количество делителей натурального числа n. Случайные тесты доходят до n = 500000. Обратите внимание, что вы должны возвращать только число, количество делителей. Числа в скобках показаны только для того, чтобы вы могли видеть, какие числа учитываются в каждом случае.

//Examples (input --> output)
//4 --> 3 (1, 2, 4)
//5 --> 2 (1, 5)
//12 --> 6 (1, 2, 3, 4, 6, 12)
//30 --> 8 (1, 2, 3, 5, 6, 10, 15, 30)

/*
 
 func divisors(_ n: UInt32) -> UInt32 {
 UInt32((1...n).filter({ n % $0 == 0 }).count)
 }
 
 divisors(5)
 
 */



// MARK: - Возьмем целое число n (n >= 0) и цифру d (0 <= d <= 9) в качестве целого числа. Возведите в квадрат все числа k (0 <= k <= n) между 0 и n. Подсчитайте количество цифр d, использованных при написании всех k**2. Вызовите nb_dig (или nbDig или...) функцию, принимающую n и d в качестве параметров и возвращающую это значение.


//Examples:
//n = 10, d = 1
//the k*k are 0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100
//We are using the digit 1 in: 1, 16, 81, 100. The total count is then 4.
//
//nb_dig(25, 1) returns 11 since
//the k*k that contain the digit 1 are:
//1, 16, 81, 100, 121, 144, 169, 196, 361, 441.
//So there are 11 digits 1 for the squares of numbers between 0 and 25.

/*

// V1
func nbDig(_ n: Int, _ d: Int) -> Int {
    var count = 0
    for k in 0...n {
        let square = k * k
        let string = String(square)
        for char in string {
            if char == Character(String(d)) {
                count += 1
            }
        }
    }
    return count
}

// V2
func nbDigV2(_ n: Int, _ d: Int) -> Int {
    return (0...n).map{"\($0 * $0)".filter { $0 == Character("\(d)")}}.flatMap { $0 }.count
}

*/



// MARK: - Даны делитель и граница. Найдите наибольшее целое число N, такое, что N делится на делитель N меньше или равно границе N больше 0. Параметры (делитель, граница), передаваемые в функцию, являются только положительными значениями.

//Input >> Output Examples

//maxMultiple (2,7) ==> return (6)
//Объяснение: (6) делится на (2) , (6) меньше или равно границе (7) , а (6) > 0 .
//
//maxMultiple (10,50)  ==> return (50)
//Объяснение: (50) делится на (10) , (50) меньше или равно границе (50) , а (50) > 0 .
//
//maxMultiple (37,200) ==> return (185)
//Объяснение: (185) делится на (37) , (185) меньше или равно границе (200) , а (185) > 0 .

/*

// V1
func maxMultiple(_ d: Int, _ b: Int) -> Int {
    let dArr = Array(d...b).sorted(by: { $0 > $1 })
    var maxN = 0
    
    for num in dArr {
        if num % d == 0 {
            maxN = num
            return num
        }
    }
    return maxN
}

// V2
func maxMultipleV2(_ d: Int, _ b: Int) -> Int {
    return (0...b).reversed().first(where: { $0 % d == 0})!
}

*/



// MARK: - Вызов: Учитывая двумерный массив целых чисел, вернуть сглаженную версию массива со всеми целыми числами в отсортированном (по возрастанию) порядке.

//Example:
//
//Given [[3, 2, 1], [4, 6, 5], [], [9, 7, 8]], your function should return [1, 2, 3, 4, 5, 6, 7, 8, 9].

/*

// V1
func flattenAndSort<T: Comparable>(_ arr: [[T]]) -> [T] {
    var sortedArray = [T]()
    for array in arr {
        for i in array {
            sortedArray.append(i)
        }
    }
    
    return sortedArray.sorted()
}

flattenAndSort([[3, 2, 1], [4, 6, 5], [], [9, 7, 8]])

// V2
func flattenAndSortV2<T: Comparable>(_ arr: [[T]]) -> [T] {
  return arr.flatMap{ $0 }.sorted()
}

*/
