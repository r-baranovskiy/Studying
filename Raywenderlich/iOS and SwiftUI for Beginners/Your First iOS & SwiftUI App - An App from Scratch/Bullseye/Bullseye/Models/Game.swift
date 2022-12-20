import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        var bonus: Int
        
        switch difference {
        case 0:
            bonus = 100
        case 1...2:
            bonus = 50
        default:
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func gameRestart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
