//
//  UserinfoVC.swift
//  GHFollowers
//
//  Created by taher elnehr on 14/01/2025.
//

import UIKit

class UserinfoVC: UIViewController {
    
    var username: String! 

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVc))
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                print(user)
            
            case .failure(let error):
                self.presntGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    @objc func dismissVc() {
        dismiss(animated: true)
    }
}
