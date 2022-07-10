//
//  Extension4SetUI.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 26.06.2022.
//

import Foundation
import UIKit
import SideMenu

extension RandomizerViewController {
    
    func setUpNavigationBar() {
        self.navigationItem.hidesBackButton = true

        self.navigationController?.isToolbarHidden = false
        self.navigationController?.navigationBar.standardAppearance.backgroundEffect = nil
        self.navigationController?.navigationBar.standardAppearance.backgroundColor = UIColor.clear
        
        let settings = UIBarButtonItem(image: UIImage(named: "slider.horizontal.3"), style: .plain, target: self, action: #selector(settings))
        let profile = UIBarButtonItem(image: UIImage(named: "person.crop.circle"), style: .plain, target: self, action: #selector(profile))
        
        navigationItem.rightBarButtonItems = [settings]
        navigationItem.rightBarButtonItem?.tintColor = .systemIndigo
        navigationItem.leftBarButtonItems = [profile]
        navigationItem.leftBarButtonItem?.tintColor = .systemIndigo
        
    }
    
    @objc func settings(sender: UIBarButtonItem?) {
        present(rightMenu!, animated: true, completion: nil)

    }
    
    @objc func profile(sender: UIBarButtonItem?) {
        present(lefMenu!, animated: true, completion: nil)

    }
    
    func sideMenuSetOptions(){
            lefMenu = SideMenuNavigationController(rootViewController: LeftSideMenuViewController())
            lefMenu?.leftSide = true
            SideMenuManager.default.leftMenuNavigationController = lefMenu
            SideMenuManager.default.addPanGestureToPresent(toView: self.view)

    
            rightMenu = SideMenuNavigationController(rootViewController: RIghtSideMenuViewController())
            SideMenuManager.default.rightMenuNavigationController = rightMenu
            SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        }
    
    func setUI() {
        restaurantImageLabel.layer.cornerRadius = CGFloat(self.restaurantImageLabel.bounds.width / 2)
        restaurantImageLabel.clipsToBounds = true
        mainButtonLabel.setTitle(AppLocalizable.repeatActionButton, for: .normal)
        wasHereButtonLabel.setTitle(AppLocalizable.iWasHere, for: .normal)
    }
}
