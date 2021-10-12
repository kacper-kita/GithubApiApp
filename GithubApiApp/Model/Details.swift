//
//  Details.swift
//  GithubApiApp
//
//  Created by Kacper Kita on 12/10/2021.
//

import Foundation

struct Detail: Decodable {
    let name: String?
    let blog: String?
    let location: String?
    let public_repos: Int?
    let public_gists: Int?
    let followers: Int?
    let following: Int?
}

