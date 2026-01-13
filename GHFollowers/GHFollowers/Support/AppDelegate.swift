//
//  AppDelegate.swift
//  GHFollowers
//
//  Created by taher elnehr on 16/10/2024.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
      
       let contentView = SearchVC()
        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = UIHostingController(rootView: contentView)
        window?.rootViewController = GFTabBarController()
        window?.makeKeyAndVisible()
        configureNavigationbar() 
        
        return true
    }

    func configureNavigationbar(){
        UINavigationBar.appearance().tintColor = .systemGreen
    }
}

