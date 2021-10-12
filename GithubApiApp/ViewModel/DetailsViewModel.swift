//
//  DetailsViewModel.swift
//  GithubApiApp
//
//  Created by Kacper Kita on 12/10/2021.
//

import Foundation

struct DetailsViewModel {
    let detail: Detail
    
    var name: String {
        return detail.name ?? "Unknown"
    }
    
    var blog: String {
        return detail.blog ?? "Unknown"
    }
    
    var location: String {
        return detail.location ?? "Unknown"
    }
    
    var public_repos: Int {
        return detail.public_repos ?? 0
    }
    
    var public_gists: Int {
        return detail.public_gists ?? 0
    }
    
    var followers: Int {
        return detail.followers ?? 0
    }
    
    var following: Int {
        return detail.following ?? 0
    }
}
