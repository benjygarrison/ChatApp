//
//  UserInfoStacks.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/22/22.
//

import UIKit

class UserInfoStackViews: UIStackView {
    
    init() {
        super .init(frame: .zero)
        
        let userLoginStack = UIStackView(arrangedSubviews: [])

        userLoginStack.axis = .vertical
        userLoginStack.spacing = 16

        //self.addSubview(userLoginStack)
        userLoginStack.anchor(top: NSLayoutYAxisAnchor? = nil,
                              left: NSLayoutXAxisAnchor? = nil,
                              right: NSLayoutXAxisAnchor? = nil,
                              paddingTop: 32,
                              paddingLeft: 32,
                              paddingRight: 32)
        
        self.addSubview(existingUserButton)
        existingUserButton.anchor(left: view.leftAnchor,
                             bottom: view.safeAreaLayoutGuide.bottomAnchor,
                             right: view.rightAnchor,
                             paddingLeft: 32,
                             paddingBottom: 16,
                             paddingRight: 32)
        
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError("UserInfoStack has not been implemented")
    }
}


//let userLoginStack = UIStackView(arrangedSubviews: [userNameContainerView,
//                                                    nameContainerView,
//                                                    emailContainerView,
//                                                    passwordContainerView,
//                                                    signUpButton])
//
//userLoginStack.axis = .vertical
//userLoginStack.spacing = 16
//
//view.addSubview(userLoginStack)
//userLoginStack.anchor(top: addPhotoButton.bottomAnchor,
//                      left: view.leftAnchor,
//                      right: view.rightAnchor,
//                      paddingTop: 32,
//                      paddingLeft: 32,
//                      paddingRight: 32)
//
//view.addSubview(existingUserButton)
//existingUserButton.anchor(left: view.leftAnchor,
//                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
//                     right: view.rightAnchor,
//                     paddingLeft: 32,
//                     paddingBottom: 16,
//                     paddingRight: 32)
