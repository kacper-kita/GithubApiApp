//
//  DetailViewController.swift
//  GithubApiApp
//
//  Created by Kacper Kita on 05/10/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    private lazy var detailView: DetailView = {
        let detailV = DetailView()
        return detailV
    }()
    
    private var data: UsersViewModel
    
    init(data: UsersViewModel) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(detailView)
        view.backgroundColor = .white
        detailView.userVM = data
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            detailView.leftAnchor.constraint(equalTo: view.leftAnchor),
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        
    }
}
