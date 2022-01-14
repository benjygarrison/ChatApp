//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/14/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: Properties
    
    //create interface items programmatically
    
    //icon
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bubble.right")
        imageView.tintColor = .white
        return imageView
    }()
    
    //email
    private let emailContainerView: UIView  = {
       let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }()
    
    //password
    private let passwordContainerView: UIView  = {
       let view = UIView()
        view.backgroundColor = .green
        
        return view
    }()
    
    //login button
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemGray
        return button
        
    }()
    
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    //MARK: Functions
    
    private func setUpUI() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .systemMint
        
        let userLoginStack = UIStackView(arrangedSubviews: [emailContainerView,
                                                            passwordContainerView,
                                                            loginButton])
        
        userLoginStack.axis = .vertical
        userLoginStack.spacing = 16
        
        
        setUpGradient()
        
        view.addSubview(icon)
        icon.centerX(inView: view)
        icon.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        icon.setDimensions(height: 120, width: 120)
        
        
        view.addSubview(userLoginStack)
        userLoginStack.anchor(top: icon.bottomAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor,
                              paddingTop: 32,
                              paddingLeft: 32,
                              paddingRight: 32)
        
    }
    
    private func setUpGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemMint.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
    
}
