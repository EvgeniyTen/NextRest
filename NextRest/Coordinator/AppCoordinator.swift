//
//  AppCoordinator.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 26.06.2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func eventOccurent(with type: Event) {
        switch type {
        case.buttonTapped:
            var vc: UIViewController & Coordinating = RandomizerViewController()
            
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func start() {
        var viewController: UIViewController & Coordinating = FirstViewController()
        viewController.coordinator = self
        navigationController?.setViewControllers([viewController], animated: false)
        
    }
}
