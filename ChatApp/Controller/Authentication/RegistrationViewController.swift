//
//  RegistrationViewController.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/14/22.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    //MARK: Properties
    
    var registrationModel = RegistrationViewModel()
    
    //Add Photo
    private let addPhotoButton: UIButton = {
        let addPhotoButton = UIButton(type: .system)
        addPhotoButton.tintColor = .white
        addPhotoButton.addTarget(self, action: #selector(addNewPhoto), for: .touchUpInside)
        return addPhotoButton
    }()
    
    //UserName
    private lazy var userNameContainerView: InputContainerViews  = {
        let containerView = InputContainerViews(image: UIImage(systemName: "person"), textField: userNameTextField)
        return containerView
    }()
    private let userNameTextField: UITextField = {
        let userNameText = UserTextFields(placeholder: "Username")
        return userNameText
    }()
    
    //Actual Name
    private lazy var nameContainerView: InputContainerViews  = {
        let containerView = InputContainerViews(image: UIImage(systemName: "person"), textField: nameTextField)
        return containerView
    }()
    private let nameTextField: UITextField = {
        let nameText = UserTextFields(placeholder: "Name")
        return nameText
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
    
    //SignUp button
    private let signUpButton: UIButton = {
        let signUpButton = SignInButtons(placeholder: "Sign Up Now!")
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return signUpButton
    }()
    
    //New user button
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
    
    //MARK: Functions
    
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
        
        userNameTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    private func validateForm() {
        if registrationModel.validForm {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = .systemBlue
            signUpButton.layer.borderWidth = 0
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = .clear
            signUpButton.layer.borderWidth = 1.0
        }
    }
    
    
    
    //MARK: Selectors
    
    @objc private func addNewPhoto() {
        let profileImagePickerController = UIImagePickerController()
        profileImagePickerController.delegate = self
        present(profileImagePickerController, animated: true, completion: nil)
    }
    
    @objc private func handleSignUp() {
 
    }
    
    @objc private func handleShowLoginView() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func textChanged(sender: UITextField) {
        switch sender {
        case userNameTextField:
            registrationModel.userName = sender.text
        case nameTextField:
            registrationModel.name = sender.text
        case emailTextField:
            registrationModel.email = sender.text
        case passwordTextField:
            registrationModel.password = sender.text
        default: break
        }
        validateForm()
        print("testing git")
    }
    
}

//MARK: Image Picker Delegates

extension RegistrationViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        <#code#>
    }
    
}
