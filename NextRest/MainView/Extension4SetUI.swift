//
//  Extension4SetUI.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 18.06.2022.
//

import UIKit

extension FirstViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        
        helloLabel.text = AppLocalizable.hello
        helloLabel.font = .boldSystemFont(ofSize: 35)

        questionLabel.text = AppLocalizable.question
        questionLabel.font = .systemFont(ofSize: 25, weight: .regular)

        descriptionLabel.text = AppLocalizable.mainDescription
        questionLabel.font = .systemFont(ofSize: 20, weight: .regular)

        subDescriptionLabel.text = AppLocalizable.subMainDescription
        questionLabel.font = .systemFont(ofSize: 20, weight: .heavy)

        
        
        buttonLabel.setTitle(AppLocalizable.actionButton, for: .normal)
        buttonLabel.backgroundColor = .systemIndigo
        buttonLabel.layer.cornerRadius = 20
        buttonLabel.setTitleColor(.white, for: .normal)
        buttonLabel.setTitleColor(.systemIndigo, for: .highlighted)

        
    }
}
