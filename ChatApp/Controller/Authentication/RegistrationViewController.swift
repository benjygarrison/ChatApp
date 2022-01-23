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
        addPhotoButton.tintColor = .white
        addPhotoButton.addTarget(self, action: #selector(addNewPhoto), for: .touchUpInside)
        return addPhotoButton
    }()
    
    //MARK: UserName
    private lazy var userNameContainerView: InputContainerViews  = {
        let containerView = InputContainerViews(image: UIImage(systemName: "person"), textField: userNameTextField)
        
        return containerView
    }()
    
    private let userNameTextField: UITextField = {
        let userNameText = UserTextFields(placeholder: "Username")
        
        return userNameText
    }()
    
    //MARK: Name
    private lazy var nameContainerView: InputContainerViews  = {
        let containerView = InputContainerViews(image: UIImage(systemName: "person"), textField: nameTextField)
        
        return containerView
    }()
    
    private let nameTextField: UITextField = {
        let nameText = UserTextFields(placeholder: "Name")
        
        return nameText
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
    
    //MARK: SignUp button
    private let signUpButton: UIButton = {
        let signUpButton = SignInButtons(placeholder: "Sign Up Now!")
        return signUpButton
    }()
    
    //MARK: New user button
    private let existingUserButton: UIButton = {
        let existingUserButton = NewUserButtons(placeholderOne: "Have an account? ", placeholderTwo: "Log In Now!")
       existingUserButton.addTarget(self, action: #selector(handleShowLoginView), for: .touchUpInside)
        
        
        return existingUserButton
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
        
        let attributedButtonTitle = NSMutableAttributedString (
        string: "+",
        attributes: [.font: UIFont.systemFont(ofSize: 40),
                        .foregroundColor: UIColor.white])
        attributedButtonTitle.append(NSAttributedString(string: "\nPhoto",
                        attributes: [.font: UIFont.boldSystemFont(ofSize: 25),
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
        
        let userLoginStack = UIStackView(arrangedSubviews: [userNameContainerView,
                                                            nameContainerView,
                                                            emailContainerView,
                                                            passwordContainerView,
                                                            signUpButton])

        userLoginStack.axis = .vertical
        userLoginStack.spacing = 16

        view.addSubview(userLoginStack)
        userLoginStack.anchor(top: addPhotoButton.bottomAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor,
                              paddingTop: 32,
                              paddingLeft: 32,
                              paddingRight: 32)
        
        view.addSubview(existingUserButton)
        existingUserButton.anchor(left: view.leftAnchor,
                             bottom: view.safeAreaLayoutGuide.bottomAnchor,
                             right: view.rightAnchor,
                             paddingLeft: 32,
                             paddingBottom: 16,
                             paddingRight: 32)

    }
    
    
    //MARK: Selectors
    
    @objc private func addNewPhoto() {
        print("photo added")
    }
    
    @objc func handleShowLoginView() {
        navigationController?.popViewController(animated: true)
    }
    
}
