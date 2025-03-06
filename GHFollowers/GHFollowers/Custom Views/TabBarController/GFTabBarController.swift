//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by taher elnehr on 21/02/2025.
//

import UIKit

class GFTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNC(), createFavouriteNC()]
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
}
