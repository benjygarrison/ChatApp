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
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: "bubble.right")
        iconImageView.tintColor = .white
        
        return iconImageView
    }()
    
    //MARK: Email
    private let emailContainerView: UIView  = {
       let emailContainerView = UIView()
        emailContainerView.backgroundColor = .clear
        emailContainerView.setHeight(height: 50)
        
        let emailImageView = UIImageView()
        emailImageView.image = UIImage(systemName: "envelope")
        emailImageView.tintColor = .white
        
        emailContainerView.addSubview(emailImageView)
        emailImageView.centerY(inView: emailContainerView)
        emailImageView.anchor(left: emailContainerView.leftAnchor, paddingLeft: 8)
        emailImageView.setDimensions(height: 24, width: 28)
        
        return emailContainerView
    }()
    
    private var emailTextField: UITextField = {
        let emailText = UITextField()
        emailText.placeholder = "Email"
        
        return emailText
    }()
    
    //MARK: Password
    private let passwordContainerView: UIView  = {
       let passwordContainerView = UIView()
        passwordContainerView.backgroundColor = .clear
        passwordContainerView.setHeight(height: 50)
        
        let passwordImageView = UIImageView()
        passwordImageView.image = UIImage(systemName: "lock")
        passwordImageView.tintColor = .white
        
        passwordContainerView.addSubview(passwordImageView)
        passwordImageView.centerY(inView: passwordContainerView)
        passwordImageView.anchor(left: passwordContainerView.leftAnchor, paddingLeft: 8)
        passwordImageView.setDimensions(height: 28, width: 28)
        
        return passwordContainerView
    }()
    
    private var passwordTextField: UITextField = {
        let passwordText = UITextField()
        passwordText.placeholder = "Password"
        passwordText.isSecureTextEntry = true
        
        return passwordText
        
    }()
    
    //MARK: Login button
    private let loginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        loginButton.backgroundColor = .clear
        loginButton.layer.borderWidth = 1.0
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.setHeight(height: 50)
        
        return loginButton
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