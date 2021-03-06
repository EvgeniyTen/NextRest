//
//  RandomizerViewModel.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 26.06.2022.
//

import Foundation
import UIKit


class RandomizerViewModel: NSObject {
    weak var controller: RandomizerViewController!
    weak var networkClient: NetworkClient!
    var restArray: [Restaurant]? = []
    
    init(_ controller: RandomizerViewController, networkClient: NetworkClient) {
        super.init()
        self.controller = controller
        self.networkClient = networkClient
        fetchData()
    }
    func fetchData() {
        networkClient.execute { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.restArray = data
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func randomize() {
        guard let arrayItem = restArray?.randomElement() else { return }

        controller.activityIndicator.startAnimating()
        guard let rating = arrayItem.rating else { randomize(); controller.ratingLabel.text = "Рейтинг ресторана: хз"; return }
        guard let price = arrayItem.priceLevelTo else {
            randomize()
            controller.infoLabel.text = "Ценовая категория,видимо, 0 из 5"
            return
        }

        guard let imageURL = arrayItem.photoUrls?.first else { randomize(); return }
        guard let url = URL(string: imageURL) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {return}

            DispatchQueue.main.async {
                self.controller.restaurantImageLabel.image = UIImage(data: data)
                self.controller.restaurantAdressLabel.text = arrayItem.address
                self.controller.restaurantNameLabel.text = arrayItem.name
                self.controller.infoLabel.text = "Ценовая категория: \(price) из 5"
                self.controller.ratingLabel.text = "Рейтинг ресторана: \(rating)"
                self.controller.activityIndicator.stopAnimating()
            }

        }
        .resume()

    }
    
}
