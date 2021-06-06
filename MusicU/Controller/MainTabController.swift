//
//  MainTabController.swift
//  MusicU
//
//  Created by mai ng on 5/28/21.
//

import UIKit


class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .yellow
        ConfigureViewController()
    }
    
    
    
    func ConfigureViewController() {
        let explore = ExploreController()
        explore.title = Titles.explore
        let nav1 = templateNotificationController(image: UIImage(named: "music_note")!, rootViewController: explore)
        
        let trending = TrendingController()
        trending.title = Titles.trending
        let nav2 = templateNotificationController(image: UIImage(named: "trending")!, rootViewController: trending)
        
        
        let search = SearchController()
        search.title = Titles.search
        let nav3 = templateNotificationController(image: UIImage(named: "search")!, rootViewController: search)
        
        let library = LibraryController()
        library.title = Titles.library
        let nav4 = templateNotificationController(image: UIImage(named: "library")!, rootViewController: library)
        
        let settings = SettingsController()
        settings.title = Titles.settings
        let nav5 = templateNotificationController(image: UIImage(named: "settings")!, rootViewController: settings)
        
        
        viewControllers = [nav1, nav2,nav3,nav4,nav5]

        
        
    }
    
    
    func templateNotificationController(image: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav =  UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
        
    }
}
