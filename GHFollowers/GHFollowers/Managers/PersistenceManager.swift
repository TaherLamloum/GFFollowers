//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by taher elnehr on 12/02/2025.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    enum Keys { static let favourites = "favourites" }
    
static func updateWith(favourite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void) {
    retriveFavorites { result in
        switch result {
        case .success(var favourites):
            
            switch actionType {
            case .add:
                guard !favourites.contains(favourite) else {
                    completed(.alreadyInFavourites)
                    return
                }
                favourites.append(favourite)
                
            case .remove:
                favourites.removeAll { $0.login == favourite.login }
            }
            completed(save(favourites: favourites))
             
        case .failure(let error):
            completed(error)
        }
    }
    }
    
    
    static func retriveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favouriteData = defaults.object(forKey: Keys.favourites) as? Data else {
            completed(.success([]))
            return 
        }
          
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .iso8601
            let favourites = try decoder.decode([Follower].self, from: favouriteData)
            completed(.success(favourites))
        } catch {
            print(error, "ERROR IN FAVOURITES")
            completed(.failure(.unableToFavourite))
        }
    }
    
    static func save(favourites: [Follower]) -> GFError?  {
         
        do {
            let encoder = JSONEncoder()
            let encodedFavourites = try encoder.encode(favourites)
            defaults.set(encodedFavourites , forKey: Keys.favourites)
            defaults.synchronize()
            return nil
        } catch {
            return .unableToFavourite
        }
    }
}
