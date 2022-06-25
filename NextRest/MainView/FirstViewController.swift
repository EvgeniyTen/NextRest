//
//  FirstViewController.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 18.06.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subDescriptionLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!

    @IBOutlet weak var blurLayerView: UIView!
    @IBOutlet weak var backgroundGradientLayer: UIView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupBackgroundGradientAnimation(view: backgroundGradientLayer)
        setupBackgroundBlur(view: blurLayerView)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    @IBAction func showNextViewController(_ sender: UIButton) {
     
    }
}


