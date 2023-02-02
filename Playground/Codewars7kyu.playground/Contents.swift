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
 
 // V3
 func flattenAndSort<T: Comparable>(_ arr: [[T]]) -> [T] {
 return arr.joined().sorted()
 }
 
 */



// MARK: - Учитывая двумерный (вложенный) список (массив, вектор,..) размера m * n, ваша задача состоит в том, чтобы найти сумму минимальных значений в каждой строке.

//[ [ 1, 2, 3, 4, 5 ]        #  minimum value of row is 1
//, [ 5, 6, 7, 8, 9 ]        #  minimum value of row is 5
//, [ 20, 21, 34, 56, 100 ]  #  minimum value of row is 20
//]

//Таким образом, функция должна вернуть 26, потому что сумма минимумов равна 1 + 5 + 20 = 26. Примечание. Вам всегда будет предоставлен непустой список, содержащий положительные значения.

/*
 
 // V1
 func sumOfMinimums(_ numbers: [[Int]]) -> Int {
 numbers.map({ $0.sorted(by: { $0 < $1 }) }).reduce((0), { $0 + ($1.first ?? 0) })
 }
 
 // V2
 func sumOfMinimumsV2(_ numbers: [[Int]]) -> Int {
 return numbers.compactMap{$0.min()}.reduce(0, +)
 }
 
 */



// MARK: - Треугольные числа называются так из-за равносторонней треугольной формы, которую они занимают, когда расположены точками. Вам нужно вернуть n-е треугольное число. Вы должны вернуть 0 для значений вне диапазона:

//1st (1)   2nd (3)    3rd (6)
//*          **        ***
//           *         **
//                     *

//For example: (Input --> Output)
//
//0 --> 0
//2 --> 3
//3 --> 6
//-10 --> 0

/*
 
 // V1
 func triangular(_ n: Int) -> Int{
 if n <= 0 {
 return 0
 }
 var arrOfArr: [[Int]] = []
 
 for num in 1...n {
 arrOfArr.append([num])
 }
 
 return arrOfArr.flatMap({ $0 }).reduce(0, +)
 }
 
 // V2
 func triangularV2(_ n: Int) -> Int{
 guard n > 0 else { return 0 }
 return n * (1 + n) / 2
 }
 
 */



// MARK: - Эта ката является первой из четырех последовательностей о «Струнах в квадрате». Вам дана строка из n строк, каждая подстрока состоит из n символов: Например: s = "abcd\nefgh\nijkl\nmnop". Мы изучим некоторые преобразования этого квадрата строк.

//Vertical mirror: vert_mirror (or vertMirror or vert-mirror)
//vert_mirror(s) => "dcba\nhgfe\nlkji\nponm"
//
//Horizontal mirror: hor_mirror (or horMirror or hor-mirror)
// hor_mirror(s) => "mnop\nijkl\nefgh\nabcd"
//
//or printed:
//
//vertical mirror   |horizontal mirror
//abcd --> dcba     |abcd --> mnop
//efgh     hgfe     |efgh     ijkl
//ijkl     lkji     |ijkl     efgh
//mnop     ponm     |mnop     abcd

//Задача: Напишите эти две функции и функция высокого порядка oper(fct, s), где fct — это функция одной переменной f, применяемая к строке s (fct будет одной из vertMirror, horMirror)

//Examples:
//s = "abcd\nefgh\nijkl\nmnop"
//oper(vert_mirror, s) => "dcba\nhgfe\nlkji\nponm"
//oper(hor_mirror, s) => "mnop\nijkl\nefgh\nabcd"

//Баш Примечание: Входные строки разделяются символом , а не \n. Выходные строки должны быть разделены \r вместо \n. См. «Примеры испытаний».

/*
 
 // V1
 func horMirror(_ s: String) -> String {
 let reversedChars = String(s.reversed())
 let subStrings = reversedChars.split(separator: "\n").map({String($0)})
 let subStringsReversed = subStrings.map({String($0.reversed())}).joined(separator: "\n")
 return subStringsReversed
 }
 func vertMirror(_ s: String) -> String {
 let arr = s.split(separator: "\n")
 let reversedArr = arr.map { String($0.reversed()) }
 return reversedArr.joined(separator: "\n")
 }
 
 func oper(_ fct: (String) -> String, _ s: String) -> String {
 return fct(s)
 }
 
 // V2
 func horMirrorV2(_ s: String) -> String {
 return s.components(separatedBy: "\n").reversed().joined(separator: "\n")
 }
 
 func vertMirrorV2(_ s: String) -> String {
 return s.components(separatedBy: "\n").map({ String($0.reversed()) }).joined(separator: "\n")
 }
 
 func operV2(_ f: (String) -> (String), _ s: String) -> String {
 return f(s)
 }
 
 // V3
 func processingString(_ string: String, performBeforeJoin closure: ([String]) -> [String]) -> String {
 return closure(string.components(separatedBy: "\n")).joined(separator: "\n")
 }
 
 func horMirrorV3(_ s: String) -> String {
 return processingString(s) {
 return $0.reversed()
 }
 }
 
 func vertMirrorV3(_ s: String) -> String {
 return processingString(s) {
 return $0.map { String($0.reversed()) }
 }
 }
 
 // replace the dots with function parameter
 func operV3(_ closure: (String) -> String, _ s: String) -> String {
 return closure(s)
 }
 
 */



// MARK: - Определите общее количество цифр в целом числе (n>=0), заданном в качестве входных данных для функции. Например, 9 — это одна цифра, 66 — 2 цифры, а 128685 — 6 цифр. Будьте осторожны, чтобы избежать переполнения/недостаточного заполнения. Все входы будут действительными.

/*
 
 func digits(num n: UInt64) -> Int {
 String(n).count
 }
 
 */


// MARK: - Вы только что въехали на совершенно прямую улицу с ровно n одинаковыми домами по обеим сторонам дороги. Естественно, вы хотели бы узнать номер дома людей на другой стороне улицы. Улица выглядит примерно так:

//Street
//1|   |6
//3|   |4
//5|   |2
//  you

//Четные увеличиваются справа; нечетные уменьшаются слева. Номера домов начинаются с 1 и увеличиваются без пробелов. Когда n = 3, 1 напротив 6, 3 напротив 4 и 5 напротив 2.
//
//Пример (адрес, n --> вывод) Учитывая адрес вашего дома и длину улицы n, укажите номер дома на противоположной стороне улицы.
//
//Примечание об ошибках Если у вас истекает время ожидания, заканчивается память или вы получаете какую-либо «ошибку», читайте дальше. И n, и адрес могут получить до 500 миллиардов с более чем 200 случайными тестами.
//
//Если вы попытаетесь сохранить адреса 500 миллиардов домов в виде списка, у вас закончится память, и тесты рухнут.

/*
 
 func overTheRoad(address: Int, street: Int) -> Int {
 street * 2 + 1 - address
 }
 
 */



// MARK: - Завершите функцию, которая принимает два числа в качестве входных данных, num и nth, и возвращает n-ю цифру num (считая справа налево). Примечание Если число отрицательное, игнорируйте его знак и рассматривайте его как положительное значение. Если nth не положительное, вернуть -1 Имейте в виду, что 42 = 00042. Это означает, что findDigit(42, 5) вернет 0

//Examples(num, nth --> output)
//5673, 4 --> 5
//129, 2 --> 2
//-2825, 3 --> 8
//-456, 4 --> 0
//0, 20 --> 0
//65, 0 --> -1
//24, -8 --> -1

/*
 
 func findDigit(_ num:Int, _ nth: Int) -> Int {
 if nth <= 0 {
 return -1
 }
 
 let numString = String(abs(num))
 let index = numString.count - nth
 
 if index < 0 {
 return 0
 }
 
 let digitString = numString[numString.index(numString.startIndex, offsetBy: index)]
 return Int(String(digitString)) ?? 0
 
 }
 
 func findDigitV2(_ num: Int, _ nth: Int) -> Int {
 let positive = abs(num)
 
 guard nth > 0 else { return -1 }
 guard positive > 0 else { return 0 }
 guard nth > 1 else { return positive % 10 }
 
 return findDigit(positive / 10, nth - 1)
 }
 
 */



// MARK: - Дана упорядоченная последовательность чисел от 1 до N. Возможно, из него удалили один номер, тогда остальные номера были перемешаны. Найдите номер, который был удален. Если из начального массива не было удалено ни одного числа, ваша функция должна вернуть int 0. Примечание. N может быть равно 1 или меньше (в последнем случае первый массив будет []). Пример:

//Example:
//
//The starting array sequence is [1,2,3,4,5,6,7,8,9]
//The mixed array with one deleted number is [3,2,4,6,7,8,1,9]
//Your function should return the int 5.

/*
 
 func findDeletedNumber(_ array: [Int], _ mixArray: [Int]) -> Int {
 if array.count == mixArray.count {
 return 0
 }
 
 let mixSortedArray = mixArray.sorted()
 
 for (index, num) in array.enumerated() {
 if num != mixSortedArray[index] {
 print(num)
 return num
 }
 }
 
 return 0
 }
 
 func findDeletedNumberV2(_ array: [Int], _ mixArray: [Int]) -> Int {
 return array.first(where: { !mixArray.contains($0) }) ?? 0
 }
 
 func findDeletedNumberV3(_ array: [Int], _ mixArray: [Int]) -> Int {
 return array.reduce(0, +) - mixArray.reduce(0, +)
 }
 
 */



// MARK: - Ваша задача состоит в том, чтобы сложить буквы в одну букву. Функция получит Array<Character>, каждый из которых представляет собой букву для добавления, и функция вернет Character. Ноты: Буквы всегда будут строчными. Буквы могут выходить за пределы (см. предпоследний пример описания) Если буквы не указаны, функция должна вернуть 'z'

/*
 
 //Examples:
 //addLetters(["a", "b", "c"]) = "f"
 //addLetters(["a", "b"]) = "c"
 //addLetters(["z"]) = "z"
 //addLetters(["z", "a"]) = "a"
 //addLetters(["y", "c", "b"]) = "d" // notice the letters overflowing
 //addLetters([]) = "z"
 
 func addLetters(_ letters: [Character]) -> Character {
 if letters.count == 0 {
 return "z"
 }
 
 var result = 0
 
 for i in letters {
 result += Int(i.asciiValue ?? 0) - 96
 if result > 26 {
 result -= 26
 }
 }
 
 let returnedResult = Character(UnicodeScalar(result + 96) ?? UnicodeScalar(1))
 return returnedResult
 }
 
 func addLettersV2(_ letters: [Character]) -> Character {
 let sum = (letters.map { Int($0.asciiValue! - 96) }.reduce(0, +) + 25) % 26 + 97
 return Character(UnicodeScalar(sum)!)
 }
 
 */



// MARK: - Задача Король Артур и его рыцари устраивают новогоднюю вечеринку. В прошлом году Ланселот приревновал Артура, потому что у Артура было свидание, а у Ланселота нет, и они затеяли дуэль. Чтобы этого больше не повторилось, Артур хочет убедиться, что в этом году на вечеринке будет как минимум столько же женщин, сколько и мужчин. Он дал вам список целых чисел всех тусовщиков. Артуру нужно, чтобы вы вернули true, если ему нужно пригласить больше женщин, или false, если все готово.

//Массив (гарантированно неассоциативный в PHP), представляющий пол участников, где -1 представляет женщин, а 1 представляет мужчин.

/*
 
 func inviteMoreWomen(_ arr: [Int]) -> Bool {
 let positiveArray = arr.filter({ $0 < 0 })
 let negativeArray = arr.filter({ $0 > 0 })
 
 return positiveArray.count == negativeArray.count || positiveArray.count > negativeArray.count ? false : true
 }
 
 func inviteMoreWomenV2(_ arr: [Int]) -> Bool {
 return arr.reduce(0, +) > 0
 }
 
 */



// MARK: - Сбалансированное число — это число, в котором сумма цифр слева от средней цифры и сумма цифр справа от средней цифры равны. Если в числе нечетное количество цифр, то средняя цифра только одна. (Например, 92645 имеет одну среднюю цифру, 6.) В противном случае есть две средние цифры. (Например, средние цифры числа 1301 — это 3 и 0.) Среднюю цифру (цифры) не следует учитывать при определении того, является ли число сбалансированным или нет, например. 413023 — сбалансированное число, потому что сумма слева и справа равна 5. Задание Учитывая число, найдите, сбалансировано ли оно, и верните строку «Сбалансировано» или «Не сбалансировано» соответственно. Передаваемое число всегда будет положительным.

//Examples
//7 ==> return "Balanced"

//Объяснение: средняя цифра (ы): 7 сумма всех цифр слева от средней цифры (цифр) -> 0 сумма всех цифр справа от средней цифры -> 0 0 и 0 равны, поэтому он сбалансирован.


//295591 ==> return "Not Balanced"

//Объяснение: средняя цифра (ы): 55 сумма всех цифр слева от средней цифры (цифр) -> 11 сумма всех цифр справа от средней цифры -> 10 11 и 10 не равны, так что это не сбалансировано.

/*
 
 func balancedNumber(_ number: Int) -> String {
 var numsArray = String(number).compactMap({ Int("\($0)") })
 if numsArray.count <= 2 {
 return "Balanced"
 }
 let midIndex = numsArray.count / 2
 if midIndex % 2 != 0 && numsArray.count > 2 {
 numsArray.remove(at: midIndex)
 } else if midIndex % 2 == 0 && numsArray.count > 3 {
 let leftSum = numsArray[..<(midIndex-1)].reduce((0), { $0 + $1 })
 let rightSum = numsArray[(midIndex+1)...].reduce((0), { $0 + $1 })
 if leftSum == rightSum {
 return "Balanced"
 }
 }
 
 let leftSum = numsArray[..<midIndex].reduce(0, +)
 let rightSum = numsArray[midIndex...].reduce(0, +)
 return leftSum == rightSum ? "Balanced" : "Not Balanced"
 }
 
 func balancedNumberV2(_ number: Int) -> String {
 let digits = String(number).compactMap{$0.wholeNumberValue }
 let part1 = digits.dropLast (digits.count/2 + 1).reduce(0,+)
 let part2 = digits.dropFirst(digits.count/2 + 1).reduce(0,+)
 return part1 == part2 ? "Balanced" : "Not Balanced"
 }
 
 func balancedNumberV3(_ number: Int) -> String {
 
 let digitCount = String(number).count
 let numberOfElementsToCompare: Int = digitCount % 2 == 0 ? (digitCount / 2) - 1 : digitCount / 2
 let intArray = String(number).map{Int(String($0))!}
 let firstHalf = intArray.prefix(numberOfElementsToCompare).reduce(0,+)
 let secondHalf = intArray.suffix(numberOfElementsToCompare).reduce(0,+)
 
 return firstHalf == secondHalf ? "Balanced" : "Not Balanced"
 
 }
 
 */



// MARK: - Измените функцию spacify, чтобы она возвращала заданную строку с пробелами, вставленными между каждым символом.

// spacify("hello world") // "h e l l o   w o r l d"

/*
 
 func spacify(_ str: String) -> String {
 return str.map { String($0) }.joined(separator: " ")
 }
 
 */

// MARK: - Сильное число — это число, сумма факториала его цифр равна самому числу. Например, 145 сильно, так как 1! + 4! + 5! = 1 + 24 + 120 = 145. Учитывая число, найдите, является ли оно сильным или нет, и верните либо "STRONG!!!!" или "Not Strong !!".

//Input >> Output Examples
//strong_num(1) ==> return "STRONG!!!!"

//Поскольку сумма факториала его цифр (1) равна самому числу, то это сильное число.

//strong_num(123) ==> return "Not Strong !!"

//Поскольку сумма факториала его цифр равна 1! + 2! + 3! = 9 не равно самому числу, тогда это Not Strong .

/*
 
 func strongNumber(_ number: Int) -> String {
 let numArray = String(number).replacingOccurrences(of: "0", with: "1").compactMap({ Int("\($0)") })
 var arrFactorial = [[Int]]()
 
 for num in numArray {
 var arr = [Int]()
 for i in 1...num {
 arr.append(i)
 }
 arrFactorial.append(arr)
 }
 
 var sumInt = Int()
 
 for sum in arrFactorial {
 sumInt += sum.reduce(1, *)
 }
 
 return sumInt == number ? "STRONG!!!!" : "Not Strong !!"
 }
 
 */



// MARK: - Теперь, когда конкуренция становится жесткой, она будет отделять мужчин от мальчиков. Мужчины - четные числа, а мальчики - нечетные. Задача Учитывая массив/список [] из n целых чисел, отделить четные числа от шансов или отделить мужчин от мальчиков. Возвращает массив/список, в котором сначала идут четные числа, а затем шансы Так как мужчины сильнее мальчиков, то четные числа по возрастанию, а шансы по убыванию. Размер массива/списка не менее 4 . Числа массива/списка могут быть как положительными, так и отрицательными. Не бойтесь, Гарантировано, что нулей не будет. Повторение чисел в массиве/списке может иметь место, поэтому (дублирование не учитывается при разделении).

//Input >> Output Examples:
//menFromBoys ({7, 3 , 14 , 17}) ==> return ({14, 17, 7, 3})
//Объяснение: Так как {14} здесь четное число, значит, оно пришло первым, затем шансы в порядке убывания {17, 7, 3}.

//menFromBoys ({-94, -99 , -100 , -99 , -96 , -99 }) ==> return ({-100 , -96 , -94 , -99})
//Объяснение: Поскольку , {-100, -96, -94} здесь четные числа, поэтому они идут сначала в *возрастающем порядке*, затем шансы в порядке убывания {-99} Так как (дупликации не учитываются при разделении), то вы можете видеть, что только один (-99) появился в конечном массиве/списке.

//menFromBoys ({49 , 818 , -282 , 900 , 928 , 281 , -282 , -1 }) ==> return ({-282 , 818 , 900 , 928 , 281 , 49 , -1})
//Объяснение: Так как {-282, 818, 900, 928} здесь четные числа, то они идут сначала в порядке возрастания, а затем в порядке убывания {281, 49, -1} Поскольку (дупликации не учитываются при разделении) , то вы можете видеть, что только один (-282) появился в конечном массиве/списке.

/*
 
 func menFromBoys(_ arr: [Int]) -> [Int] {
 var unicSet: Set<Int> = []
 arr.forEach({ unicSet.insert($0) })
 
 let evenArray = unicSet.filter({ $0 % 2 == 0 }).sorted(by: { $0 < $1 })
 let oddArray = unicSet.filter({ $0 % 2 != 0 }).sorted(by: { $0 > $1 })
 
 return evenArray + oddArray
 }
 
 func menFromBoysV2(_ arr: [Int]) -> [Int] {
 let men: [Int] = Array(Set(arr.filter{ $0 % 2 == 0 })).sorted()
 let boys: [Int] = Array(Set(arr.filter{ $0 % 2 != 0 })).sorted { $0 > $1 }
 return men + boys
 }
 
 */



// MARK: - Задача Каждый день растение растет на метры upSpeed. Каждую ночь высота этого растения уменьшается на метры downSpeed ​​из-за недостатка солнечного тепла. Изначально растение имеет высоту 0 метров. Мы сажаем семена в начале дня. Мы хотим знать, когда высота растения достигнет определенного уровня.

//Пример Для upSpeed ​​= 100, downSpeed ​​= 10 и requiredHeight = 910 вывод должен быть равен 10.

//After day 1 --> 100
//After night 1 --> 90
//After day 2 --> 190
//After night 2 --> 180
//After day 3 --> 280
//After night 3 --> 270
//After day 4 --> 370
//After night 4 --> 360
//After day 5 --> 460
//After night 5 --> 450
//After day 6 --> 550
//After night 6 --> 540
//After day 7 --> 640
//After night 7 --> 630
//After day 8 --> 730
//After night 8 --> 720
//After day 9 --> 820
//After night 9 --> 810
//After day 10 --> 910

//Для upSpeed ​​= 10, downSpeed ​​= 9 и requiredHeight = 4 вывод должен быть равен 1. Потому что растение достигает желаемой высоты в день 1 (10 метров).

//Input/Output
//[input] integer upSpeed
//
//A positive integer representing the daily growth.
//
//Constraints: 5 ≤ upSpeed ≤ 100.
//
//[input] integer downSpeed
//
//A positive integer representing the nightly decline.
//
//Constraints: 2 ≤ downSpeed < upSpeed.
//
//[input] integer desiredHeight
//
//A positive integer representing the threshold.
//
//Constraints: 4 ≤ desiredHeight ≤ 1000.
//
//[output] an integer

//Количество дней, которые потребуются растению для достижения/преодоления заданной высоты (включая последний день в общем счете).

/*

func growingPlant(_ upSpeed: Int, _ downSpeed: Int, _ desiredHeight: Int) -> Int {
    var daysCont = 0
    var currentHeight = 0
    
    while currentHeight < desiredHeight {
        currentHeight += upSpeed
        daysCont += 1
        
        if currentHeight >= desiredHeight {
            return daysCont;
        }
        
        currentHeight -= downSpeed;
    }
    return daysCont
}

growingPlant(100, 10, 910)

*/
