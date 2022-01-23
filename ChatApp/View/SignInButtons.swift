//
//  SetUpButtons.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/22/22.
//

import UIKit

class SignInButtons: UIButton {
    
    init(placeholder: String) {
        super .init(frame: .zero)
          
            self.setTitle(placeholder, for: .normal)
            self.setTitleColor(.white, for: .normal)
            self.layer.cornerRadius = 5
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            self.backgroundColor = .clear
            self.layer.borderWidth = 1.0
            self.layer.borderColor = UIColor.white.cgColor
            self.setHeight(height: 50)
            self.isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("SignInButton has not been implemented")
    }
    
    
}

