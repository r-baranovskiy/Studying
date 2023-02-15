import UIKit

protocol Porsche {
    func getPrice() -> Double
    func getDescription() -> String
}

class Boxter: Porsche {
    func getPrice() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porsche Boxter"
    }
}

class PorscheDecorator: Porsche {
    private let decoratedPorsche: Porsche
    
    required init(decoratedPorsche: Porsche) {
        self.decoratedPorsche = decoratedPorsche
    }
    
    func getPrice() -> Double {
        return decoratedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorsche.getDescription()
    }
}

class PremiumAudioSystem: PorscheDecorator {
    
    required init(decoratedPorsche: Porsche) {
        super.init(decoratedPorsche: decoratedPorsche)
    }
    
    override func getPrice() -> Double {
        super.getPrice() + 30
    }
    
    override func getDescription() -> String {
        super.getDescription() + " with premium audio system"
    }
}

class PanoramicSunroof: PorscheDecorator {
    
    required init(decoratedPorsche: Porsche) {
        super.init(decoratedPorsche: decoratedPorsche)
    }
    
    override func getPrice() -> Double {
        super.getPrice() + 20
    }
    
    override func getDescription() -> String {
        super.getDescription() + " with panoramic sunroof"
    }
}

var porscheBoxter: Porsche = Boxter()
porscheBoxter.getDescription() // "Porsche Boxter"
porscheBoxter.getPrice() // 120

porscheBoxter = PremiumAudioSystem(decoratedPorsche: porscheBoxter) // PremiumAudioSystem
porscheBoxter.getDescription() // "Porsche Boxter with premium audio system"
porscheBoxter.getPrice() // 150

porscheBoxter = PanoramicSunroof(decoratedPorsche: porscheBoxter)
porscheBoxter.getDescription() // "Porsche Boxter with premium audio system with panoramic sunroof"
porscheBoxter.getPrice() // 170
