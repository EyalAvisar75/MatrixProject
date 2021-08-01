//
//  CategoryView.swift
//  MatrixProject
//
//  Created by eyal avisar on 01/08/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import UIKit

class CategoryController: UIViewController {
    
    
    var categoryName = UILabel()
    var categoryId = UILabel()
    var categoryImage = UIImageView()
    
    var item = (0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryName.text = attractionsByCategories[item.0][item.1]["Title"] as! String
        categoryId.text = String(attractionsByCategories[item.0][item.1]["CatId"] as! Int)
        categoryImage.image = UIImage(named: "person")
    }
}
