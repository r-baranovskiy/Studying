import UIKit

protocol SwimBehaviour {
    func swim()
}

class ProfessionalSwimmer: SwimBehaviour {
    func swim() {
        print("Professional swimming")
    }
}

class NonSwimmer: SwimBehaviour {
    func swim() {
        print("non-swimming")
    }
}



protocol DiveBehaviour {
    func dive()
}

class ProfessionalDiver: DiveBehaviour {
    func dive() {
        print("Professional diving")
    }
}

class NewbieDiver: DiveBehaviour {
    func dive() {
        print("Newbie diving")
    }
}

class NonDiver: DiveBehaviour {
    func dive() {
        print("Non-diving")
    }
}


class Human {
    
    private var diveBehaviour: DiveBehaviour
    private var swimBehaviour: SwimBehaviour
    
    init(diveBehaviour: DiveBehaviour, swimBehaviour: SwimBehaviour) {
        self.diveBehaviour = diveBehaviour
        self.swimBehaviour = swimBehaviour
    }
    
    func setSwimBehaviour(with behaviour: SwimBehaviour) {
        self.swimBehaviour = behaviour
    }
    
    func setDiveBehaviour(with behaviour: DiveBehaviour) {
        self.diveBehaviour = behaviour
    }
    
    func performSwim() {
        swimBehaviour.swim()
    }
    
    func performDive() {
        diveBehaviour.dive()
    }
}

let human = Human(diveBehaviour: ProfessionalDiver(), swimBehaviour: NonSwimmer())

human.setSwimBehaviour(with: ProfessionalSwimmer())
human.performSwim()

human.setDiveBehaviour(with: NonDiver())
human.performDive()
