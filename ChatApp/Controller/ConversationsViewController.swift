//
//  ConversationsViewController.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/13/22.
//

import UIKit


class ConversationsViewController: UIViewController {
    
//MARK: Properties
    
    private let tableView = UITableView()
    private let reuseIdentifier = "ConversationCellId"

    
    
//MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpNavigationBar()
        setUpTableView()
    }
    
    
//MARK: Selectors
    
    @objc private func showProfile() {
        print("123")
    }
    
    //set up UI
    private func setUpUI() {
        view.backgroundColor = .white
    }
    
    //set up nav bar
    private func setUpNavigationBar() {
        //configures navBar to utilize upper screen properly
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .systemMint
        
        //allows navBar to compress/decompress when tableView is scrolled
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        //basic UI declarations
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark //currently not working properly; return to this
        
        //adds clickable image to navBar
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(showProfile))
        
    }
    
    //set up tableView
    private func setUpTableView() {
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView() //sets correct number of row borders
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
}


//MARK: TableView Delegate

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
//MARK: TableView Datasource

extension ConversationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
