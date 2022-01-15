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
    private lazy var emailContainerView: InputContainerView  = {
        let containerView = InputContainerView(image: UIImage(systemName: "envelope"), textField: emailTextField)
        
        return containerView
    }()
    
    private let emailTextField: UITextField = {
        let emailText = SetUpTextFields(placeholder: "Email")
        
        return emailText
    }()
    
    //MARK: Password
    private lazy var passwordContainerView: UIView  = {
        let containerView = InputContainerView(image: UIImage(systemName: "lock"), textField: passwordTextField)
        
        return containerView
    }()
    
    private let passwordTextField: UITextField = {
        let passwordText = SetUpTextFields(placeholder: "Password")
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
    
    //MARK: New user button
    private let newUserButton: UIButton = {
        let newUserButton = UIButton(type: .system)
        
        let attributedButtonTitle = NSMutableAttributedString ( //must be mutable in order to append
        string: "No account?  ",
        attributes: [.font: UIFont.systemFont(ofSize: 16),
                        .foregroundColor: UIColor.white])
        attributedButtonTitle.append(NSAttributedString(string: "Sign up now!",
                        attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                        .foregroundColor: UIColor.white]))
        newUserButton.setAttributedTitle(attributedButtonTitle, for: .normal)
        
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

    private func setUpGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemMint.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
    
    //MARK: Selectors
    
    @objc func handleShowSignUpView() {
        let controller = RegistrationViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

