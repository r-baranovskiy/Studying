//
//  ViewController.swift
//  MPV-Study-Project
//
//  Created by Кащенко on 8.02.23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    
    @IBAction func buttonDidTap(_ sender: Any) {
        self.presenter?.showGreeting()
    }


}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
    
    private func setTimer() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
            print("Timer works")
            timer.fire()
        }
    }
}

