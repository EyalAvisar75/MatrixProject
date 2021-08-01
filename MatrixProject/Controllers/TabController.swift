//
//  TabController.swift
//  MatrixProject
//
//  Created by eyal avisar on 01/08/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import UIKit

import UIKit
class TabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tabOne = CategoriesController()
        let tabOneBarItem = UITabBarItem(title: "Discounts", image: nil, selectedImage: nil)
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = RecommendedController()
        let tabTwoBarItem = UITabBarItem(title: "Recommended", image: nil, selectedImage: nil)
        
        tabTwo.tabBarItem = tabTwoBarItem
        
                
        // Create Tab three
        let tabThree = TreatsController()
        let tabThreeBarItem = UITabBarItem(title: "My Treats", image: nil, selectedImage: nil)

        tabThree.tabBarItem = tabThreeBarItem

        // Create Tab three
        let tabFour = FavoritesController()
        let tabFourBarItem = UITabBarItem(title: "Favorites", image: nil, selectedImage: nil)

        tabFour.tabBarItem = tabFourBarItem
        
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
    }    
}

extension TabController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
