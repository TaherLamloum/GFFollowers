//
//  Follower.swift
//  GHFollowers
//
//  Created by taher elnehr on 23/11/2024.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
    
}
