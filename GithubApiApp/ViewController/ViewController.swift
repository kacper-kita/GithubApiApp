//
//  ViewController.swift
//  GithubApiApp
//
//  Created by Kacper Kita on 09/08/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var mainView: MainView = {
        let mainV = MainView()
        return mainV
    }()
    
    private lazy var tableView: UITableView = {
        let tableV = UITableView()
        tableV.translatesAutoresizingMaskIntoConstraints = false
        tableV.register(MainTableView.self, forCellReuseIdentifier: "mainViewCell")
        tableV.delegate = self
        tableV.dataSource = self
        
        return tableV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        NetworkManager.shared.getUsers { (user) in
            guard let user = user else {return}
            print(user[0].login)
        }
    }

    func setupView() {
        view.addSubview(mainView)
        view.addSubview(tableView)
        view.backgroundColor = .white
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            mainView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainViewCell") as! MainTableView
        
        cell.titleLabel.text = "dziala"
        
        return cell
    }
}

