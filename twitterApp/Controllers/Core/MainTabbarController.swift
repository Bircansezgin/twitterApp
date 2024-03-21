//
//  ViewController.swift
//  twitterApp
//
//  Created by Bircan Sezgin on 3/22/24.
//
#Preview{
    MainTabbarController()
}


import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemBackground
        setupViewController()
    }


}

extension MainTabbarController{
    private func setupViewController(){
        
        //Connetions ViewController for tabbar!
        
        let viewControllerHome = UINavigationController(rootViewController: HomeViewController())
        let viewControllerSearch = UINavigationController(rootViewController: SearchViewController())
        let viewControllerNotif = UINavigationController(rootViewController: NotificationViewController())
        let viewControllerDirect = UINavigationController(rootViewController: DirectMessageViewController())
        
        
        viewControllerHome.tabBarItem.image = UIImage(systemName: "house.fill")
        viewControllerHome.tabBarItem.selectedImage = UIImage(systemName: "house")
        
        viewControllerSearch.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        viewControllerNotif.tabBarItem.image = UIImage(systemName: "bell.fill")
        viewControllerNotif.tabBarItem.selectedImage = UIImage(systemName: "bell")
        

        viewControllerDirect.tabBarItem.image = UIImage(systemName: "envelope.fill")
        viewControllerDirect.tabBarItem.selectedImage = UIImage(systemName: "envelope")
        
        //SET
        setViewControllers([viewControllerHome, viewControllerSearch, viewControllerNotif, viewControllerDirect], animated: true)
    }
}
