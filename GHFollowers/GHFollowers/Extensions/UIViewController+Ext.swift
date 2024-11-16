//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by taher elnehr on 12/11/2024.
//

import UIKit

extension UIViewController {
    func presntGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true )
        }
    }
}
