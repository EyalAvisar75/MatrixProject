//
//  CategoryView.swift
//  MatrixProject
//
//  Created by eyal avisar on 01/08/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import UIKit

class CategoryController: UIViewController {
    var dismissButton = UIButton()
    var categoryName = UILabel()
    var categoryId = UILabel()
    var categoryImage = UIImageView()
    var item: [Int] = [0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissButton()
        addCategoryName()
        addCategoryId()
        addCategoryImage()
    }
    
    func addDismissButton() {
        dismissButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
        dismissButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissCategoryController), for: .touchUpInside)
        view.addSubview(dismissButton)
    }
    
    func addCategoryName() {
        categoryName = UILabel(frame: CGRect(x: 0, y: 110, width: view.bounds.width, height: 100))
        categoryName.textAlignment = .right
        categoryName.text = attractionsByCategories[item[0]][item[1]]["Title"] as! String
        
        view.addSubview(categoryName)
    }
    
    func addCategoryId() {
        categoryId = UILabel(frame: CGRect(x: 0, y: 210, width: view.bounds.width, height: 100))
        categoryId.textAlignment = .right
        
        categoryId.text = "קטגוריה" + " " +  String(attractionsByCategories[item[0]][item[1]]["CatId"] as! Int)
        
        view.addSubview(categoryId)
    }
    
    func addCategoryImage() {
        categoryImage = UIImageView(frame: CGRect(x: view.bounds.width * 0.66, y: 320, width: view.bounds.width / 3, height: view.bounds.height / 3))
        categoryImage.image = UIImage(systemName: "person")
        categoryImage.contentMode = .scaleAspectFit
        view.addSubview(categoryImage)
    }
    
    @objc func dismissCategoryController() {
        dismiss(animated: true, completion: nil)
    }
}
