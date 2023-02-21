import UIKit

// MARK: - Если мы перечислим все натуральные числа до 10, кратные 3 или 5, мы получим 3, 5, 6 и 9. Сумма этих кратных равна 23. Завершите решение так, чтобы оно возвращало сумму всех чисел, кратных 3 или 5, меньше переданного числа. Кроме того, если число отрицательное, верните 0 (для языков, в которых они есть). Примечание. Если число кратно и 3, и 5, считайте его только один раз.

/*
 
 // V1
 func solution(_ num: Int) -> Int {
 var nums = [Int]()
 
 if num <= 0 {
 return 0
 }
 
 for number in 1..<num {
 if number % 3 == 0 || number % 5 == 0 {
 nums.append(number)
 }
 }
 return nums.reduce(0, +)
 }
 
 // V2
 func solutionV2(_ num: Int) -> Int {
 return num < 3 ? 0 : (3..<num).filter({($0 % 3) * ($0 % 5) == 0}).reduce(0, +)
 }
 
 // V3
 func solutionV3(_ num: Int) -> Int {
 guard num > 3 else {
 return 0
 }
 
 return (3..<num).reduce(0) {
 $1 % 3 == 0 || $1 % 5 == 0 ? $0 + $1 : $0
 }
 }
 
 */




// MARK: - Напишите функцию, которая принимает строку из одного или нескольких слов и возвращает ту же строку, но с перевернутыми всеми словами из пяти или более букв (точно так же, как имя этого Ката). Передаваемые строки будут состоять только из букв и пробелов. Пробелы будут включены только в том случае, если присутствует более одного слова.

//Examples:
//
//spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"
//spinWords( "This is a test") => returns "This is a test"
//spinWords( "This is another test" )=> returns "This is rehtona test"

/*
 
 func spinWords(in sentence: String) -> String {
 let strings = sentence.components(separatedBy: " ")
 
 let reversedStrings = strings
 .map({ $0.count >= 5 ? String($0.reversed()) : $0 })
 
 return reversedStrings.joined(separator: " ")
 }
 
 */



// MARK: - Дан массив целых чисел, найдите то, которое встречается нечетное количество раз. Всегда будет только одно целое число, которое встречается нечетное количество раз.

//Examples
//[7] should return 7, because it occurs 1 time (which is odd).
//[0] should return 0, because it occurs 1 time (which is odd).
//[1,1,2] should return 2, because it occurs 1 time (which is odd).
//[0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
//[1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

/*

// V1
func findIt(_ seq: [Int]) -> Int {
    var dict = [Int: Int]()
    
    for num in seq {
        if let count = dict[num] {
            dict[num] = count + 1
        } else {
            dict[num] = 1
        }
    }
    
    for (key, value) in dict {
        if value % 2 == 1 {
            return key
        }
    }
    
    return -1
}

// V2
func findItV2(_ seq: [Int]) -> Int {
  seq.reduce(0, ^)
}

*/
