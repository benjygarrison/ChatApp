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
    private lazy var userNameContainerView: InputContainerView  = {
        let containerView = InputContainerView(image: UIImage(systemName: "person"), textField: userNameTextField)
        
        return containerView
    }()
    
    private let userNameTextField: UITextField = {
        let userNameText = SetUpTextFields(placeholder: "Username")
        
        return userNameText
    }()
    
    //MARK: Name
    private lazy var nameContainerView: InputContainerView  = {
        let containerView = InputContainerView(image: UIImage(systemName: "person"), textField: nameTextField)
        
        return containerView
    }()
    
    private let nameTextField: UITextField = {
        let nameText = SetUpTextFields(placeholder: "Name")
        
        return nameText
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
    
    //MARK: SignUp button
    private let signUpButton: UIButton = {
        let signUpButton = SetUpButtons(placeholder: "Sign Up Now!")
//        signUpButton.setTitle("Sign Up Now!", for: .normal)
//        signUpButton.setTitleColor(.white, for: .normal)
//        signUpButton.layer.cornerRadius = 5
//        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        signUpButton.backgroundColor = .clear
//        signUpButton.layer.borderWidth = 1.0
//        signUpButton.layer.borderColor = UIColor.white.cgColor
//        signUpButton.setHeight(height: 50)
        
        return signUpButton
    }()
    
    //MARK: New user button
    private let existingUserButton: UIButton = {
        let existingUserButton = UIButton(type: .system)
        
        let attributedButtonTitle = NSMutableAttributedString ( //must be mutable in order to append
        string: "Have an account?  ",
        attributes: [.font: UIFont.systemFont(ofSize: 16),
                        .foregroundColor: UIColor.white])
        attributedButtonTitle.append(NSAttributedString(string: "Log In Now!",
                        attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                        .foregroundColor: UIColor.white]))
        existingUserButton.setAttributedTitle(attributedButtonTitle, for: .normal)
        
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
        //let controller = LoginViewController()
        navigationController?.popViewController(animated: true)
    }
    
}
