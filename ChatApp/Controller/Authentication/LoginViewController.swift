//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/14/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: Properties
    
    private var loginModel = LoginViewModel()
    
    //icon
    private let icon: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: "bubble.right")
        iconImageView.tintColor = .white
        return iconImageView
    }()
    
    //Email
    private lazy var emailContainerView: InputContainerViews  = {
        let containerView = InputContainerViews(image: UIImage(systemName: "envelope"), textField: emailTextField)
        return containerView
    }()
    private let emailTextField: UITextField = {
        let emailText = UserTextFields(placeholder: "Email")
        return emailText
    }()
    
    //Password
    private lazy var passwordContainerView: UIView  = {
        let containerView = InputContainerViews(image: UIImage(systemName: "lock"), textField: passwordTextField)
        return containerView
    }()
    private let passwordTextField: UITextField = {
        let passwordText = UserTextFields(placeholder: "Password")
        passwordText.isSecureTextEntry = true
        return passwordText
    }()
    
    //Login button
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
        loginButton.isEnabled = false
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return loginButton
    }()
    
    //New user button
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
    
    //MARK: Functions
    
    private func setUpUI() {
        setUpGradient()
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .systemMint
        
        view.addSubview(icon)
        icon.centerX(inView: view)
        icon.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        icon.setDimensions(height: 120, width: 120)

        let userLoginStack = UIStackView(arrangedSubviews: [emailContainerView,
                                                            passwordContainerView,
                                                            loginButton])

        userLoginStack.axis = .vertical
        userLoginStack.spacing = 16

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
        
        emailTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    private func validateForm() {
        if loginModel.validForm {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .systemBlue
            loginButton.layer.borderWidth = 0
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .clear
            loginButton.layer.borderWidth = 1.0
        }
    }
    
    //MARK: Selectors
    
    @objc private func handleLogin() {
        print("Log In")
    }
    
    @objc private func handleShowSignUpView() {
        let controller = RegistrationViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func textChanged(sender: UITextField) {
        if sender == emailTextField {
            loginModel.email = sender.text
        } else {
            loginModel.password = sender.text
        }
        validateForm()
    }
    
}

