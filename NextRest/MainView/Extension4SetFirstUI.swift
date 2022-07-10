//
//  Extension4SetUI.swift
//  NextRest
//
//  Created by Евгений Тимофеев on 18.06.2022.
//

import UIKit

extension FirstViewController {
    
    func setupUI() {
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
    
    func setupBackgroundGradientAnimation(view: UIView) {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.type = .axial
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.gray.cgColor, UIColor.systemIndigo.cgColor]
        let newColors = [UIColor.systemIndigo.cgColor, UIColor.systemPurple.cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.setAnimateForColors(newColors, animated: true, withDuration: 3, timingMethodName: .linear)
        view.layer.addSublayer(gradientLayer)
    }
    
    func setupBackgroundBlur(view: UIView) {
        
        let blurView: UIVisualEffectView = {
            let view = UIVisualEffectView()
            view.clipsToBounds = true
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        } ()
        view.addSubview(blurView)
        blurView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        blurView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        blurView.effect = blurEffect

        
        view.setRoundCorners([.topLeft, .bottomLeft, .topRight, .bottomRight], radius: 40)
       
        
    }
}
