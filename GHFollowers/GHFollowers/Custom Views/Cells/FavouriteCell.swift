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
    
//    var favourite: Follower? {
//        didSet {
//            guard let favourite = favourite else { return }
//            if self.tag == userIdentifier {
//               
//            }
//           
//        }
//    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favourite: Follower, userIdentifier: Int) {
        if self.tag == userIdentifier {
            avatarImageView.downloadImage(fromURL: favourite.avatar_url)
            usernameLabel.text = favourite.login
        }
    
    }
    
    private func configureUI() {
        addSubviews(avatarImageView, usernameLabel)
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40 )
        ])
    }
    
    override func prepareForReuse() {
//        self.favourite = nil
    }
}
