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
        addPhotoButton.centerX(inView: view)
        addPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        addPhotoButton.backgroundColor = .clear
        addPhotoButton.layer.borderWidth = 3.0
        addPhotoButton.layer.borderColor = UIColor.white.cgColor
        addPhotoButton.layer.cornerRadius = 60
        addPhotoButton.setTitle("+", for: .normal)
        addPhotoButton.titleLabel?.font = UIFont.systemFont(ofSize: 75, weight: .regular)
        addPhotoButton.setDimensions(height: 120, width: 120)

    }
    
    
    //MARK: Selectors
    
    @objc private func addNewPhoto() {
        print("photo added")
    }
    
}
