import UIKit

protocol Subject {
    func add(obeserver: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString string: String)
}

class Teacher: Subject {
    
    var observerCollection = NSMutableSet()
    
    var homeTask: String = "" {
        didSet {
            notify(withString: homeTask)
        }
    }
    
    func add(obeserver: PropertyObserver) {
        observerCollection.add(obeserver)
    }
    
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    
    func notify(withString string: String) {
        for observer in observerCollection {
            (observer as! PropertyObserver).didGet(newTask: string)
        }
    }
    
}


protocol PropertyObserver {
    func didGet(newTask task: String)
}


class Pupil: NSObject, PropertyObserver {
    
    var homeTask = ""
    
    func didGet(newTask task: String) {
        homeTask = task
        print("New homework to be done")
    }
}

let teacher = Teacher()
let pupil = Pupil()

teacher.add(obeserver: pupil)
teacher.homeTask = "Task #3"

pupil.homeTask
