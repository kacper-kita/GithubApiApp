//
//  Users.swift
//  Users
//
//  Created by Kacper Kita on 14/08/2021.
//

import Foundation

struct User: Decodable {
    let login: String?
    let avatar_url: String?
    let url: String?
}

struct Users: Decodable {
    let all: [User]
}
