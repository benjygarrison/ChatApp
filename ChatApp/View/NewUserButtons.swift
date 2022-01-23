//
//  NewUserButtons.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/22/22.
//

import UIKit

class NewUserButtons: UIButton {
    
    init(placeholderOne: String, placeholderTwo: String) {
        super .init(frame: .zero)
        
        let attributedButtonName = NSMutableAttributedString ( //must be mutable in order to append
        string: placeholderOne,
        attributes: [.font: UIFont.systemFont(ofSize: 16),
                        .foregroundColor: UIColor.white])
        attributedButtonName.append(NSAttributedString(string: placeholderTwo,
                        attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                        .foregroundColor: UIColor.white]))
        self.setAttributedTitle(attributedButtonName, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("NewUserButton has not been implemented")
    }
}
