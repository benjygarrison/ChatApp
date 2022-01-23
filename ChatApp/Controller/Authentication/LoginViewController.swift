//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/14/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: Properties
    
    //icon
    private let icon: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: "bubble.right")
        iconImageView.tintColor = .white
        
        return iconImageView
    }()
    
    //MARK: Email
    private lazy var emailContainerView: InputContainerViews  = {
        let containerView = InputContainerViews(image: UIImage(systemName: "envelope"), textField: emailTextField)
        
        return containerView
    }()
    
    private let emailTextField: UITextField = {
        let emailText = UserTextFields(placeholder: "Email")
        
        return emailText
    }()
    
    //MARK: Password
    private lazy var passwordContainerView: UIView  = {
        let containerView = InputContainerViews(image: UIImage(systemName: "lock"), textField: passwordTextField)
        
        return containerView
    }()
    
    private let passwordTextField: UITextField = {
        let passwordText = UserTextFields(placeholder: "Password")
        passwordText.isSecureTextEntry = true
       
        return passwordText
    }()
    
    //MARK: Login button
    private let loginButton: UIButton = {
        let loginButton = SignInButtons(placeholder: "Log In")
        return loginButton
    }()
    
    //MARK: New user button
    private let newUserButton: UIButton = {
        let newUserButton = NewUserButtons(placeholderOne: "No account? ", placeholderTwo: "Sign Up Now!")
        newUserButton.addTarget(self, action: #selector(handleShowSignUpView), for: .touchUpInside)

        
        return newUserButton
    }()
    
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    //MARK: Layout
    
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

        view.addSubview(newUserButton)
        newUserButton.anchor(left: view.leftAnchor,
                             bottom: view.safeAreaLayoutGuide.bottomAnchor,
                             right: view.rightAnchor,
                             paddingLeft: 32,
                             paddingBottom: 16,
                             paddingRight: 32)
    }
    
    //MARK: Selectors
    
    @objc func handleShowSignUpView() {
        let controller = RegistrationViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

