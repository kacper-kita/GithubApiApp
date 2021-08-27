//
//  UsersListViewModel.swift
//  UsersListViewModel
//
//  Created by Kacper Kita on 27/08/2021.
//

import Foundation

class UsersListViewModel {
    var userVM = [UsersViewModel]()
    
    func getUsers(completion: @escaping ([UsersViewModel]) -> Void) {
        NetworkManager.shared.getUsers { (users) in
            guard let users = users else {
                return
            }
            let userVM = users.map(UsersViewModel.init)
            DispatchQueue.main.async {
                self.userVM = userVM
                completion(userVM)
            }
        }
    }
}
