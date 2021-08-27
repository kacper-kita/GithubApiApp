//
//  UsersViewModel.swift
//  UsersViewModel
//
//  Created by Kacper Kita on 27/08/2021.
//

import Foundation
import Metal

struct UsersViewModel {
    let user: User
    
    var login: String {
        return user.login ?? "Unknown"
    }
    
    var avatar_url: String {
        return user.avatar_url ?? "https://www.kindpng.com/imgv/iwowxJ_vector-graphics-computer-icons-clip-art-user-profile/"
    }
    
    var url: String {
        return user.url ?? "Unknown"
    }
}
