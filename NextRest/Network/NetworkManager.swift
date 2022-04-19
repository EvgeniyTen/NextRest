//
//  NetworkManager.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 11.04.2022.
//

import Foundation
import Alamofire

let path = Bundle.main.path(forResource: "moscowRests", ofType: "json")
let url = URL(fileURLWithPath: path!)


class NetworkClient  {
    
   public var restaurantsArray = [Restaurant]()
    
    func execute(_ url: URL) {
        AF.request(url).responseJSON { [weak self] response in
            guard let self = self else {return}
            if let error = response.error { print(error.localizedDescription)
                return
            }

            guard let data = response.data,
                  let dataFromJSON = try? JSONDecoder().decode([Restaurant].self, from: data) else { print("Decode error")
                return
                  }
                self.restaurantsArray = dataFromJSON
            
        }
    }
}
