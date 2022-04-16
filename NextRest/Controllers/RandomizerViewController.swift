//
//  DetailViewController.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 28.02.2022.
//

import UIKit
import Alamofire
import AlamofireImage




class RandomizerViewController: UIViewController {
    
    
    //переписать инициализатор для избавления от зависимостей
    var networkClient = NetworkClient()
    
    @IBOutlet weak var mainButtonLabel: UIButton!
    
    @IBOutlet weak var personalInfoLabel: UIButton!
    @IBOutlet weak var settingsLabel: UIButton!
    
    @IBOutlet weak var wasHereButtonLabel: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var restaurantImageLabel: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantAdressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var imageConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personalInfoLabel.isHidden = true
        settingsLabel.isHidden = true
        
        networkClient.execute(url)
        setImage()
        wasHereButtonLabel.isHidden = true
        mainButtonLabel.titleLabel?.text = "Погнали!"
    }
    
    
    
    
    
    
    
    
    @IBAction func repeatAction(_ sender: Any) {
        randomize()
        personalInfoLabel.isHidden = false
        settingsLabel.isHidden = false
        imageConstraint.constant = view.bounds.height / 4
        wasHereButtonLabel.isHidden = false
        
    }
    
    @IBAction func wasHereButton(_ sender: UIButton) {
    }
    
    
    // MARK: Helper functions
    
    
    func randomize() {
        guard let arrayItem = networkClient.restaurantsArray.randomElement() else { return }
        
        activityIndicator.startAnimating()
        guard let rating = arrayItem.rating else {
            randomize()
            ratingLabel.text = "Рейтинг ресторана: хз"
            return
        }
        guard let price = arrayItem.priceLevelTo else {
            randomize()
            infoLabel.text = "Ценовая категория,видимо, 0 из 5"
            return
        }
        guard let imageURL = arrayItem.photoUrls?.first else { randomize(); return }
        guard let url = URL(string: imageURL) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.restaurantImageLabel.image = UIImage(data: data)
                self.restaurantAdressLabel.text = arrayItem.address
                self.restaurantNameLabel.text = arrayItem.name
                self.infoLabel.text = "Ценовая категория: \(price) из 5"
                self.ratingLabel.text = "Рейтинг ресторана: \(rating)"
                self.activityIndicator.stopAnimating()
            }
            
        }
        .resume()
        
    }
    
    private func setImage() {
        DispatchQueue.main.async {
            self.restaurantImageLabel.layer.cornerRadius = CGFloat((self.restaurantImageLabel.bounds.width / 2) / 3)
            self.restaurantImageLabel.clipsToBounds = true
        }
    }
}


