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

protocol NetworkClientProtocol {
    func execute(completion: @escaping(Result<[Restaurant]?, Error>) -> Void)
}

class NetworkClient: NetworkClientProtocol  {
    func execute( completion: @escaping (Result<[Restaurant]?, Error>) -> Void) {
                AF.request(url)
                    .validate(statusCode: 200..<300)
                    .responseDecodable(of: [Restaurant].self) { [weak self] response in
                        guard self != nil else {return}
                        if let error = response.error {
                            print(error.localizedDescription)
                            completion(.failure(error))
                            return
                        }
        
                        guard let data = response.data,
                              let dataFromJSON = try? JSONDecoder().decode([Restaurant].self, from: data) else {
                                  print("Decode error")
                                  return
                              }
                        completion(.success(dataFromJSON))
        
                    }
            }
    }
    

    
    
