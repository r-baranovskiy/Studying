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
