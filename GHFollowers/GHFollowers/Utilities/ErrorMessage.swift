//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by taher elnehr on 07/12/2024.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This user name created invalid request. please try again"
    case unableToComplete = "Unable to complete your request. please check your internet connection"
    case invalidResponse = "Invalid response from the server. please try again"
    case invalidData = "The data received from the server was invalid. please try again."
}
