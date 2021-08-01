//
//  TabController.swift
//  MatrixProject
//
//  Created by eyal avisar on 01/08/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import UIKit

import UIKit
class OffersTabController: UITabBarController {
    
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
        
        var title = "My Treats"
        addLabel(view: tabThree.view, title: title)
        
        tabThree.tabBarItem = tabThreeBarItem

        // Create Tab three
        title = "Favorites"
        
        let tabFour = FavoritesController()
        let tabFourBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        
        tabFour.tabBarItem = tabFourBarItem
        addLabel(view: tabFour.view, title: title)

        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
    }
    
    //Helper Methods
    
    func addLabel(view: UIView, title: String) {
        let titleLabel = UILabel()
        titleLabel.text = title
        view.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraint = titleLabel.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint = titleLabel.heightAnchor.constraint(equalToConstant: 100)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])                
    }
}

extension OffersTabController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
