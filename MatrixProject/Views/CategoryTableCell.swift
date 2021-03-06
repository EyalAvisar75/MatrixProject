//
//  CategoryTableCell.swift
//  MatrixProject
//
//  Created by eyal avisar on 01/08/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import UIKit

protocol CategoryTableCellDelegate : AnyObject {
    func didSelectItem(categoryItem:(category:Int, row:Int))
}

class CategoryTableCell: UITableViewCell {
    
    //MARK:- Properties
    var isCenterLayout = false
    var categoryName = UILabel()
    
    let categoryGallery: UICollectionView = {
        let layout = SmoothFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    var categoryId = 0
    var viewTitle = ""
    public weak var attractionDelegate: CategoryTableCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addLabel()
        addCategoryGallery()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Helper methods
    func addCategoryGallery() {
        contentView.addSubview(categoryGallery)
        
        
        categoryGallery.bounces = false
        categoryGallery.semanticContentAttribute = .forceRightToLeft
        categoryGallery.translatesAutoresizingMaskIntoConstraints = false
        
        categoryGallery.topAnchor.constraint(equalTo: categoryName.bottomAnchor).isActive = true
        categoryGallery.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        categoryGallery.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        categoryGallery.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        categoryGallery.delegate = self
        categoryGallery.dataSource = self
        categoryGallery.collectionViewLayout = isCenterLayout ? CenterCollectionFlowLayout() : SmoothFlowLayout()
        
        categoryGallery.register(ImageCollectionCell.self, forCellWithReuseIdentifier: Identifiers.categoryGallery.rawValue)
    }
    
    func addLabel() {
        
        contentView.addSubview(categoryName)
                
        categoryName.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = categoryName.topAnchor.constraint(equalTo: contentView.topAnchor)
        
        let rightConstraint = categoryName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        
        let widthConstraint = categoryName.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint = categoryName.heightAnchor.constraint(equalToConstant: 100)
        contentView.addConstraints([topConstraint, widthConstraint, heightConstraint, rightConstraint])
    }
}

extension CategoryTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attractionsByCategories[categoryId - 1].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.categoryGallery.rawValue, for: indexPath) as! ImageCollectionCell
        
        cell.isHidden = false
        
        cell.discountImage.image = UIImage(systemName: "person")        
        cell.subtitleLabel.text = (attractionsByCategories[categoryId - 1][indexPath.row]["STitle"] as! String)
        
        
        if attractionsByCategories[categoryId - 1].count == indexPath.row {
            cell.isHidden = true
        }
        return cell
    }
}

extension CategoryTableCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if attractionsByCategories[categoryId - 1].count == indexPath.row {
            return
        }
        attractionDelegate?.didSelectItem(categoryItem: (categoryId - 1, indexPath.row))
    }
}

extension CategoryTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 150)
    }
}


