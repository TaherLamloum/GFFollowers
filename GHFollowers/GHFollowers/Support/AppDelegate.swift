//
//  AppDelegate.swift
//  GHFollowers
//
//  Created by taher elnehr on 16/10/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
     
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = GFTabBarController()
        window?.makeKeyAndVisible()
        configureNavigationbar() 
        
        return true
    }

    func configureNavigationbar(){
        UINavigationBar.appearance().tintColor = .systemGreen
    }
}

