//
//  RegistrationViewController.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/14/22.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    //MARK: Properties
    
    private let addPhotoButton: UIButton = {
        let addPhotoButton = UIButton(type: .system)
        //addPhotoButton.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        addPhotoButton.tintColor = .white
        addPhotoButton.addTarget(self, action: #selector(addNewPhoto), for: .touchUpInside)
        return addPhotoButton
    }()
    
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
    }
    
    //MARK: Layout
    
    private func setUpUI() {
        setUpGradient()
        
        view.addSubview(addPhotoButton)
        
        let attributedButtonTitle = NSMutableAttributedString ( //must be mutable in order to append
        string: "+",
        attributes: [.font: UIFont.systemFont(ofSize: 40),
                        .foregroundColor: UIColor.white])
        attributedButtonTitle.append(NSAttributedString(string: "\nphoto",
                        attributes: [.font: UIFont.systemFont(ofSize: 25),
                        .foregroundColor: UIColor.white]))
        addPhotoButton.setAttributedTitle(attributedButtonTitle, for: .normal)
        
        addPhotoButton.centerX(inView: view)
        addPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        addPhotoButton.backgroundColor = .clear
        addPhotoButton.layer.borderWidth = 3.0
        addPhotoButton.layer.borderColor = UIColor.white.cgColor
        addPhotoButton.layer.cornerRadius = 60
        addPhotoButton.titleLabel?.lineBreakMode = .byWordWrapping
        addPhotoButton.titleLabel?.textAlignment = .center
        addPhotoButton.setDimensions(height: 120, width: 120)

    }
    
    
    //MARK: Selectors
    
    @objc private func addNewPhoto() {
        print("photo added")
    }
    
}
