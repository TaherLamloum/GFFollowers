//
//  FollowersListView.swift
//  GHFollowers
//
//  Created by taher lamloum on 26/12/2025.
//

import SwiftUI

struct FollowersListView: View {
    @StateObject var viewModel = FollowersViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading Followers...")
                        .padding()
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.followers) { follower in
                        HStack {
                            AsyncImage(url: URL(string: follower.avatarUrl)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())

                            Text(follower.login)
                                .font(.headline)
                        }
                    }
                    .refreshable {
                        viewModel.fetchFollowers(for: "TaherLamloum")
                    }
                }
            }
            .navigationTitle("Followers")
            .onAppear {
                viewModel.fetchFollowers(for: "TaherLamloum")
            }
        }
    }
}
