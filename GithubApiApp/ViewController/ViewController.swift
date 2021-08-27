//
//  ViewController.swift
//  GithubApiApp
//
//  Created by Kacper Kita on 09/08/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = UsersListViewModel()
    
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
        fetchUsers()
    }

    private func setupView() {
        view.addSubview(mainView)
        view.addSubview(tableView)
        view.backgroundColor = .white
        
        setupConstraints()
    }
    
    private func setupConstraints() {
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
    
    private func fetchUsers() {
        viewModel.getUsers { (_) in
            self.tableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainViewCell") as! MainTableView
        
        let user = viewModel.userVM[indexPath.row]
        cell.userVM = user
        
        return cell
    }
}

