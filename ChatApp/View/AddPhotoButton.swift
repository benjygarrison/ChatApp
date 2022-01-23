//
//  AddPhotoButton.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/23/22.
//

import UIKit

class AddPhotoButton: UIButton {
    
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .clear
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 75.0
        self.titleLabel?.textColor = .white
        self.setTitle("Add Photo", for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        //self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.textAlignment = .center
        self.setDimensions(height: 150, width: 150)
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("addPhotoButton has not been implemented")
    }
}
