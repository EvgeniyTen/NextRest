//
//  RandomizerViewController.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 26.06.2022.
//

import UIKit
import SideMenu


class RandomizerViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    var networkClient = NetworkClient()
    lazy var viewModel: RandomizerViewModel = {
        .init(self, networkClient: networkClient)
    }()
    
    var lefMenu: SideMenuNavigationController?
    var rightMenu: SideMenuNavigationController?

    @IBOutlet weak var mainButtonLabel: UIButton!
    @IBOutlet weak var wasHereButtonLabel: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var restaurantImageLabel: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantAdressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    

    
    override func viewWillAppear(_ animated: Bool) {
        setUI()
        setUpNavigationBar()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async { [self] in
            viewModel.fetchData()
        }
        sideMenuSetOptions()
        

    }

        @IBAction func repeatAction(_ sender: Any) {
            viewModel.randomize()
            mainButtonLabel.setTitle(AppLocalizable.repeatActionButton, for: .normal)
        }
    
        @IBAction func wasHereButton(_ sender: UIButton) {
    
        }
    
        // MARK: Helper functions
   
}
