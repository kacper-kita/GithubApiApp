//
//  DetailView.swift
//  GithubApiApp
//
//  Created by Kacper Kita on 05/10/2021.
//

import Foundation
import UIKit

final class DetailView: UIView {
    
    var userVM: UsersViewModel? {
        didSet {
            if let userVM = userVM {
                NetworkManager.shared.getImage(urlString: userVM.avatar_url) { (data) in
                    guard let data = data else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) ERROR")
    }
    
    private func setupView() {
        addSubview(imageView)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 400),
            imageView.widthAnchor.constraint(equalToConstant: 400)
        ])
    }
    
}


