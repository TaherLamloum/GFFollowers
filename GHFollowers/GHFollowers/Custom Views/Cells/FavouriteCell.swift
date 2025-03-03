//
//  FavouriteCell.swift
//  GHFollowers
//
//  Created by taher elnehr on 13/02/2025.
//

import UIKit

class FavouriteCell: UITableViewCell {

    static let reuseID = "FavouriteCell"
    let avatarImageView = GFAvatarImageView(frame: .zero )
    let usernameLabel = GFTitlelabel(textAligment: .left, fontSize: 26)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favourite: Follower) {
        usernameLabel.text = favourite.login
        NetworkManager.shared.downloadImage(from: favourite.avatarURL) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.avatarImageView.image = image  }
        }
    }
    
    private func configureUI() {
        addSubviews(avatarImageView, usernameLabel)
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40 )
        ])
    }
}
