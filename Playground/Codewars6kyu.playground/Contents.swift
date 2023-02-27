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



// MARK: - Цифровой корень — это рекурсивная сумма всех цифр числа. Учитывая n, возьмите сумму цифр n. Если это значение имеет более одной цифры, продолжайте уменьшать таким образом, пока не будет получено однозначное число. Ввод будет неотрицательным целым числом.

//Examples
//    16  -->  1 + 6 = 7
//   942  -->  9 + 4 + 2 = 15  -->  1 + 5 = 6
//132189  -->  1 + 3 + 2 + 1 + 8 + 9 = 24  -->  2 + 4 = 6
//493193  -->  4 + 9 + 3 + 1 + 9 + 3 = 29  -->  2 + 9 = 11  -->  1 + 1 = 2

/*
 
 // V1
 func digitalRoot(of number: Int) -> Int {
 return (1 + (number - 1) % 9)
 }
 
 // V2
 func digitalRootV2(of number: Int) -> Int {
 let arr = String(number).compactMap({ Int("\($0)") })
 var sum = arr.reduce(0, +)
 
 while sum > 10 {
 let arr = String(sum).compactMap({ Int("\($0)") })
 sum = arr.reduce(0, +)
 }
 return sum
 }
 
 */



// MARK: - Напишите функцию, которая принимает целое число в качестве входных данных и возвращает количество битов, равных единице в двоичном представлении этого числа. Вы можете гарантировать, что ввод неотрицательный. Пример: двоичное представление числа 1234 равно 10011010010, поэтому в этом случае функция должна вернуть 5.

/*
 
 func countBits(_ n: Int) -> Int {
 return String(n, radix: 2).filter({ $0 == "1" }).count
 }
 
 func countBitsV2(_ n: Int) -> Int {
 return n.nonzeroBitCount
 }
 
 */



// MARK: - Вам дан массив (который будет иметь длину не менее 3, но может быть очень большим), содержащий целые числа. Массив либо полностью состоит из нечетных целых чисел, либо полностью состоит из четных целых чисел, за исключением одного целого числа N. Напишите метод, который принимает массив в качестве аргумента и возвращает этот «выброс» N.

//Examples
//[2, 4, 0, 100, 4, 11, 2602, 36]
//Should return: 11 (the only odd number)
//
//[160, 3, 1719, 19, 11, 13, -21]
//Should return: 160 (the only even number)

/*
 
 func findOutlier(_ array: [Int]) -> Int {
 let showrtPartArray = array[0...2]
 if showrtPartArray.filter({ $0 % 2 == 0 }).count > 1 {
 for num in array {
 if num % 2 != 0 {
 return num
 }
 }
 } else {
 for num in array {
 if num % 2 == 0 {
 return num
 }
 }
 }
 
 return 0
 }
 
 func findOutlierV2(_ array: [Int]) -> Int {
 let evens = array.filter { $0 % 2 == 0 }
 let odds = array.filter { $0 % 2 != 0 }
 return evens.count < odds.count ? evens[0] : odds[0]
 }
 
 */



// MARK: - Подсчитайте количество дубликатов. Напишите функцию, которая будет возвращать количество различных буквенных символов и цифр, не зависящих от регистра, которые встречаются во входной строке более одного раза. Можно предположить, что входная строка содержит только буквы (как прописные, так и строчные) и числовые цифры.

//Example
//"abcde" -> 0 # no characters repeats more than once
//"aabbcde" -> 2 # 'a' and 'b'
//"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
//"indivisibility" -> 1 # 'i' occurs six times
//"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
//"aA11" -> 2 # 'a' and '1'
//"ABBA" -> 2 # 'A' and 'B' each occur twice

/*
 
 func countDuplicates(_ input: String) -> Int {
 let loweredInput = input.lowercased()
 var charCount: [Character: Int] = [:]
 var duplicatesCount = 0
 
 for char in loweredInput {
 if let count = charCount[char] {
 charCount[char] = count + 1
 } else {
 charCount[char] = 1
 }
 }
 
 for (_, count) in charCount {
 if count > 1 {
 duplicatesCount += 1
 }
 }
 
 return duplicatesCount
 }
 
 func countDuplicatesV2(_ s:String) -> Int {
 var counts: [String: Int] = [:]
 for character in Array(s) {
 counts[character.lowercased(), default: 0] += 1
 }
 return counts.values.filter{ $0 > 1 }.count
 }
 
 */



// MARK: - Цель этого упражнения - преобразовать строку в новую строку, где каждый символ в новой строке равен "(", если этот символ появляется только один раз в исходной строке, или ")", если этот символ появляется более одного раза в исходной строке. Игнорируйте заглавные буквы при определении того, является ли символ дубликатом.

//Examples
//"din"      =>  "((("
//"recede"   =>  "()()()"
//"Success"  =>  ")())())"
//"(( @"     =>  "))(("

/*
 
 func duplicateEncode(_ word: String) -> String {
 let characters = Array(word.lowercased())
 var outputString = ""
 
 for char in characters {
 if characters.filter({ $0 == char }).count > 1 {
 outputString += ")"
 } else {
 outputString += "("
 }
 }
 
 return outputString
 
 }
 
 */



// MARK: - Напишите функцию persistence, которая принимает положительный параметр num и возвращает его мультипликативную стойкость, то есть количество раз, которое вы должны умножить на num, пока не получите одну цифру.

//For example (Input --> Output):
//
//39 --> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit)
//999 --> 4 (because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2)
//4 --> 0 (because 4 is already a one-digit number)

/*

func persistence(for num: Int) -> Int {
    let arr = String(num).compactMap({ Int("\($0)") })
    
    return arr.count == 1 ? 0 : 1 + persistence(for: arr.reduce(1, *))
}

func persistenceV2(for num: Int) -> Int {
    var count = 0
    var num = num
    while num > 9 {
        var temp = 1
        for i in String(num) {
            temp *= Int(String(i))!
        }
        num = temp
        count += 1
    }
    return count
}

*/
