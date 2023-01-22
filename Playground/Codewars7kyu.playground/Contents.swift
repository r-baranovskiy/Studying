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
