//
//  ImageCollectionCell.swift
//  MatrixProject
//
//  Created by eyal avisar on 01/08/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import UIKit


class ImageCollectionCell: UICollectionViewCell {
    var discountImage = UIImageView()
    var subtitleLabel = UILabel()
    
    override var bounds: CGRect {
        didSet {
            contentView.frame = bounds
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        discountImage = UIImageView(frame: self.bounds)
        discountImage.contentMode = .scaleAspectFit

        contentView.addSubview(discountImage)
        
        subtitleLabel = UILabel(frame: CGRect(x: 20, y: 20, width: self.bounds.width - 20, height: 20))
        subtitleLabel.clipsToBounds = false
        subtitleLabel.numberOfLines = 0
        subtitleLabel.lineBreakMode = .byWordWrapping
        
        subtitleLabel.textColor = UIColor.black
        contentView.addSubview(subtitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
