//
//  FirstViewController.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 18.06.2022.
//

import UIKit

class FirstViewController: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subDescriptionLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var blurLayerView: UIView!
    @IBOutlet weak var backgroundGradientLayer: UIView!
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isToolbarHidden = true
        setupBackgroundBlur(view: blurLayerView)
        setupBackgroundGradientAnimation(view: backgroundGradientLayer)
        setupUI()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func showNextViewController(_ sender: UIButton) {
        coordinator?.eventOccurent(with: .buttonTapped)
    }
}


