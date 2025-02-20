//
//  GFError.swift
//  GHFollowers
//
//  Created by taher elnehr on 17/01/2025.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This user name created invalid request. please try again"
    case unableToComplete = "Unable to complete your request. please check your internet connection"
    case invalidResponse = "Invalid response from the server. please try again"
    case invalidData = "The data received from the server was invalid. please try again."
    case unableToFavourite = "There was an error favouriting this user. please try again"
    case alreadyInFavourites = "you are already favouriting this user"
}
