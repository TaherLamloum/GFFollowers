//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by taher elnehr on 12/11/2024.
//

import UIKit
import SafariServices


extension UIViewController {
    func presntGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        print(title, "Alert_Title")
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true )
        }
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = .systemGreen
        present(safariVC, animated: true)
    }
 
}
