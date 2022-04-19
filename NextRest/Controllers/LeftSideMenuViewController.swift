//
//  LeftSideMenuViewController.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 19.04.2022.
//

import UIKit

class LeftSideMenuViewController: UIViewController {
    @IBOutlet weak var viewLabel: UIView!
    @IBOutlet weak var customerAvatarLabel: UIImageView!
    @IBOutlet weak var customerNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLabel.layer.cornerRadius = 20
    }

}
