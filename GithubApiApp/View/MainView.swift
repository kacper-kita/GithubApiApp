//
//  MainView.swift
//  MainView
//
//  Created by Kacper Kita on 09/08/2021.
//

import Foundation
import UIKit

final class MainView: UIView {
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Github Users"
        label.font = UIFont(name: "Rockwell", size: 26)
        
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) ERROR")
    }
    
    func setupView() {
        addSubview(mainLabel)

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            mainLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
