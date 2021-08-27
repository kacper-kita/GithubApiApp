//
//  MainTableView.swift
//  MainTableView
//
//  Created by Kacper Kita on 10/08/2021.
//

import UIKit

final class MainTableView: UITableViewCell {
    
    var userVM: UsersViewModel? {
        didSet {
            if let userVM = userVM {
                titleLabel.text = userVM.login
                NetworkManager.shared.getImage(urlString: userVM.avatar_url) { (data) in
                    guard let data = data else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.userImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    var userImageData: Data? {
        didSet {
            if let data = userImageData {
                
            }
        }
    }
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 15
        return image
        
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(userImage)
        
        setupConstraints()
    }
    //TODO: Fix problem with images
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            userImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userImage.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 50),
            userImage.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
