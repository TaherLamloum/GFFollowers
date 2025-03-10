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
    
    let decoder = JSONDecoder()

    
    private init() {
      decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func getFollowers(for username: String, page: Int) async throws -> [Follower] {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            throw GFError.invalidUsername
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GFError.invalidResponse
        }
        do {
            return try decoder.decode([Follower].self, from: data)
            
        } catch {
            print(error, "DECODING ERROR...")
            throw GFError.invalidData
        }
    }

    func getUserInfo(for username: String) async throws -> User {
        let endpoint = baseURL + "\(username)"
        guard let url = URL(string: endpoint) else {
            throw GFError.invalidUsername
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GFError.invalidResponse
        }
        do {
            return try decoder.decode(User.self, from: data)
        } catch {
            throw GFError.invalidData
        }
    }
    
    func downloadImage(from urlString: String) async -> UIImage? {
        let cacheKey = NSString(string: urlString)
        if let image = cashe.object(forKey: cacheKey) {
            return image
        }
        guard let url = URL(string: urlString) else {
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard  let image = UIImage(data: data) else { return nil }
            cashe.setObject(image, forKey: cacheKey)
            return image
        } catch {
            return nil
        }
    }
}
