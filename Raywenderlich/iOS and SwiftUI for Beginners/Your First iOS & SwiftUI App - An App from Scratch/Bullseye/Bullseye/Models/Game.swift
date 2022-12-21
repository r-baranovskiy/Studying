import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 1337, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 1488, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 228, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 88, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 27, date: Date()))
        }
    }
    
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
        addToLeaderboard(score: points)
    }
    
    mutating func gameRestart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
    mutating func addToLeaderboard(score: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries = leaderboardEntries.sorted(by: { $0.score > $1.score })
    }
}
