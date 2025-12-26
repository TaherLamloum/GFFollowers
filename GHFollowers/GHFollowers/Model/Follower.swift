//
//  Follower.swift
//  GHFollowers
//
//  Created by taher elnehr on 23/11/2024.
//

import Foundation

struct Follower: Codable, Hashable, Identifiable {
    var login: String
    var avatar_url: String
    var id: Int?
}
