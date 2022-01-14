//
//  ConversationsViewController.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/13/22.
//

import UIKit

private let reuseIdentifier = "ConversationCellId"

class ConversationsViewController: UIViewController {
    
    //MARK: Properties
    private let tableView = UITableView()
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpNavigationBar()
        setUpTableView()
    }
    
    
    //MARK: Functions
    
    @objc private func showProfile() {
        print("123")
    }
    
    //set up UI
    private func setUpUI() {
        view.backgroundColor = .white
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(showProfile))
    }
    
    //set up nav bar
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
    
    //set up tableView
    private func setUpTableView() {
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
}

extension ConversationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = "Test"
        return cell
    }
    
    
}

extension ConversationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
