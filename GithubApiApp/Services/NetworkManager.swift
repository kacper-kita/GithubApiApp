//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Kacper Kita on 14/08/2021.
//

import Foundation

class NetworkManager {
    let imageCache = NSCache<NSString, NSData>()
    
    static let shared = NetworkManager()
    
    func createURL() -> URL {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/users"
        
        guard let url = components.url else {
            preconditionFailure("Failed to construct URL")
        }
        
        return url
    }
    
    func getUsers(completion: @escaping ([User]?) -> Void) {
        let url = createURL()
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let users = try? JSONDecoder().decode([User].self, from: data)
            users == nil ? completion(nil) : completion(users)
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
                
            }.resume()
        }
        
    }
}
