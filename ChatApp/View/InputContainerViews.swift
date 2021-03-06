//
//  InputContainerView.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/15/22.
//

import UIKit

class InputContainerViews: UIView {
    
    init(image: UIImage?, textField: UITextField) {
        super.init(frame: .zero)
        
        setHeight(height: 50)
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = .white
        
        addSubview(imageView)
        imageView.centerY(inView: self)
        imageView.anchor(left: leftAnchor, paddingLeft: 8)
        imageView.setDimensions(height: 24, width: 28)
        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: imageView.rightAnchor,
                              bottom: bottomAnchor,
                              right: rightAnchor,
                              paddingTop: 8,
                              paddingLeft: 8)
        
        let divider = UIView()
        divider.backgroundColor = .white
        addSubview(divider)
        divider.anchor(left: leftAnchor,
                       bottom: bottomAnchor,
                       right: rightAnchor,
                       paddingLeft: 8,
                       height: 0.75)
    }
    
    required init?(coder: NSCoder) {
        fatalError("InputContainerView has not been implemented")
    }
}
