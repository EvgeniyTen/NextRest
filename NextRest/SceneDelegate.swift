//
//  SceneDelegate.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 28.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let coordinator = AppCoordinator()
        let navigationVC = UINavigationController()
        coordinator.navigationController = navigationVC
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationVC
        window.makeKeyAndVisible()
        self.window = window
        coordinator.start()

    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

