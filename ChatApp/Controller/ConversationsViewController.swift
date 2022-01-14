//
//  ConversationsViewController.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/13/22.
//

import UIKit

class ConversationsViewController: UIViewController {
    
    //MARK: Properties
    
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpNavigationBar()
    }
    
    
    //MARK: Functions
    
    @objc private func showProfile() {
        print("123")
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        
        
        
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(showProfile))
    }
    
    private func setUpNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .systemMint
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
        
    }
    
    
    
    
    
    
    
    
    
    
}
