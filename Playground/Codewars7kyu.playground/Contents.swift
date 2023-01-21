import UIKit

// MARK: - Найдите сумму внутренних углов (в градусах) n-стороннего простого многоугольника. N будет больше 2.

func angle(_ n: Int) -> Int {
    180 * (n - 2)
}

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


