//
//  SceneDelegate.swift
//  AppleCourceUIKit
//
//  Created by Кащенко on 9.02.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let layout = UICollectionViewFlowLayout()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ReminderListViewController(collectionViewLayout: layout)
        window?.makeKeyAndVisible()
    }
}

