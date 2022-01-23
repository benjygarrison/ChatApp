//
//  GradientExtension.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/18/22.
//

import UIKit

extension UIViewController {
    
    func setUpGradient() {
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemMint.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
