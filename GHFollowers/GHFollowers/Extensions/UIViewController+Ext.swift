//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by taher elnehr on 12/11/2024.
//

import UIKit
import SafariServices

extension UIViewController {
     
    func presentGFAlert(title: String, message: String, buttonTitle: String) {
        print(title, "Alert_Title")
        let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true )
    }
    
    func presentDefaultError( ) {
        print(title, "Alert_Title")
        let alertVC = GFAlertVC(alertTitle: "Some thing went wrong ",
                                message: "We are unable to comlete this task at this time. Please try again.",
                                buttonTitle: "Ok")
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true )
    }
    
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
