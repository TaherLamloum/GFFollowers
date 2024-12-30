//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by taher elnehr on 24/11/2024.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    let cashe = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { Data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            guard let data = Data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .useDefaultKeys
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
