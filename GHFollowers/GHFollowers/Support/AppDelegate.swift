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
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
        configureNavigationbar() 
        
        return true
    }
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
         searchVC.title = "Search"
         searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    func createFavouriteNC() -> UINavigationController {
        let favouriteListVC = FavouriteListVC()
        favouriteListVC.title = "Favourites"
        favouriteListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favouriteListVC)
    }
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar().tintColor = .systemGreen
        
        tabBar.viewControllers = [createSearchNC(), createFavouriteNC()]
        return tabBar
    }
    func configureNavigationbar(){
        UINavigationBar.appearance().tintColor = .systemGreen
    }
}

