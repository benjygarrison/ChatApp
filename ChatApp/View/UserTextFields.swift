//
//  SetUpTextFields.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/15/22.
//

import UIKit

class UserTextFields: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 16)
        keyboardAppearance = .dark
        attributedPlaceholder = NSAttributedString (
        string: placeholder,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textColor = .white
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("SetUpTextField has not been implemented")
    }
    
}
