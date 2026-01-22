//
//  MainTabVC.swift
//  newApp1
//
//  Created by Анастасия on 14.10.2025.
//
import UIKit

final class MainTabVC: UITabBarController {
    
    var menuVC: MenuVC = {
        let controller = MenuVC()
        
        let image = UIImage(systemName: "menucard")
        let selectedImage = UIImage(systemName: "menucard.fill")
        let tabItem = UITabBarItem.init(title: "Меню", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        
        return controller
    }()
    
    var cartVC: CartVC = {
        let controller = CartVC()
        
        let image = UIImage(systemName: "cart")
        let selectedImage = UIImage(systemName: "cart.fill")
        let tabItem = UITabBarItem.init(title: "Корзина", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        tabBar.tintColor = .black
        viewControllers = [menuVC, cartVC]
    }

}
