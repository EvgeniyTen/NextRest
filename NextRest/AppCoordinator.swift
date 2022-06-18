//
//  AppCoordinator.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 18.06.2022.
//

import Foundation
import UIKit

class CustomAppCoordinator {
    var window: UIWindow
    let scene: UIScene
    
    init(window: UIWindow, scene: UIScene) {
        self.window = window
        self.scene = scene
    }

    func start() {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let start = FirstViewController()
        window.windowScene = windowScene
        
        window.rootViewController = start
        window.makeKeyAndVisible()
    }

}
