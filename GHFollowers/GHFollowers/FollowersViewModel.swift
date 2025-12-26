//
//  FollowersViewModel.swift
//  GHFollowers
//
//  Created by taher lamloum on 26/12/2025.
//


import Foundation
import Combine


class FollowersViewModel: ObservableObject {
    @Published var followers: [Follower] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchFollowers(for username: String = "octocat") {
        self.isLoading = true
        self.errorMessage = nil
        guard let url = URL(string: "https://api.github.com/users/\(username)/followers") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
            }

            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                return
            }

            guard let data = data else { return }

            do {
                let decoded = try JSONDecoder().decode([Follower].self, from: data)
                DispatchQueue.main.async {
                    self.followers = decoded
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Decoding error: \(error)"
                }
            }
        }.resume()
    }
}
