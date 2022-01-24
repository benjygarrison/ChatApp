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
    private var addPhotoButton: UIButton = {
        var addPhotoButton = AddPhotoButton()
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
        let signUpButton = UIButton(type: .system)
        signUpButton.setTitle("Sign Up Now!", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.layer.cornerRadius = 5
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        signUpButton.backgroundColor = .clear
        signUpButton.layer.borderWidth = 1.0
        signUpButton.layer.borderColor = UIColor.white.cgColor
        signUpButton.setHeight(height: 50)
        signUpButton.isEnabled = false
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
        setUpTextFieldObservers()
    }
    
    //MARK: Functions
    
    private func setUpUI() {
        setUpGradient()
        
        view.addSubview(addPhotoButton)
        
        
        
        addPhotoButton.centerX(inView: view)
        addPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
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
        
//        userNameTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
//        nameTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
//        emailTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
//        passwordTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
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
    
    private func setUpTextFieldObservers() {
        userNameTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    
    
    //MARK: Selectors
    
    @objc private func addNewPhoto() {
        let profileImagePickerController = UIImagePickerController()
        profileImagePickerController.delegate = self
        present(profileImagePickerController, animated: true, completion: nil)
    }
    
    @objc private func handleSignUp() {
        print("Sign Up Now!")
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
    }
    
}

//MARK: Image Picker Delegates

extension RegistrationViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        addPhotoButton.titleLabel?.textColor = .clear
        addPhotoButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        addPhotoButton.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        addPhotoButton.layer.borderWidth = 3.0
        addPhotoButton.layer.cornerRadius = 75.0
        //addPhotoButton.imageView?.contentMode = .scaleAspectFill
        dismiss(animated: true, completion: nil)
    }
    
}
