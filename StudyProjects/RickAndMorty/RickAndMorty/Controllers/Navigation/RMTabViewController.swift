import UIKit

final class RMTabBarController: UITabBarController {
    
    private let charactersVC = RMCharacterViewController()
    private let locationsVC = RMLocationViewController()
    private let episodesVC = RMEpisodeViewController()
    private let settingsVC = RMSettingsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        viewControllers = [
            createNavigationVC(rootVC: charactersVC, title: "CharacterVC", imageSystemName: "heart"),
            createNavigationVC(rootVC: locationsVC, title: "LocationVC", imageSystemName: "heart"),
            createNavigationVC(rootVC: episodesVC, title: "EpisodeVC", imageSystemName: "heart"),
            createNavigationVC(rootVC: settingsVC, title: "SettingsVC", imageSystemName: "heart")
        ]
    }
    
    private func createNavigationVC(rootVC: UIViewController,
                                    title: String,
                                    imageSystemName: String) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = UIImage(systemName: imageSystemName, withConfiguration: UIImage.SymbolConfiguration(weight: .heavy))
        return navVC
    }


}

