import Foundation

//MARK: - Arrays

var prices = [1.50, 10.00, 4.99, 2.30, 8.19]

//For in
for price in prices {
    print(price)
}

//ForEach
prices.forEach({ print($0) })

//Map
let salePrices = prices.map({ $0 * 0.9 })

let stringSalePrices =  prices.map { (price) -> String in
    String(format: "%.2f", price)
}

//compactMap
let userInput = ["meow", "15", "37.5", "seven"]

let validInput = userInput.compactMap({ Int($0) }) //15


//flatMap
let arrayOfDwarfArrays = [
    ["Sleepy", "Grumpy", "Doc", "Bashful", "Sneezy"],
    ["Thorin", "Nori", "Bombut"]
]

let dwarvesAfterM = arrayOfDwarfArrays.flatMap { (dwarves) -> [String] in
    var dwarvesAfterM: [String] = []
    
    for dwarf in dwarves where dwarf > "M" {
        dwarvesAfterM.append(dwarf)
    }
    return dwarvesAfterM
}

let dwarvesAfterC = arrayOfDwarfArrays.flatMap { (dwarves) -> [String] in
    dwarves.filter({ $0 > "C" })
}
