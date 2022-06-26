//
//  AppCoordinator.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 18.06.2022.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    var navigationController: UINavigationController? {get set}
    
    func eventOccurent(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? {get set}
}


