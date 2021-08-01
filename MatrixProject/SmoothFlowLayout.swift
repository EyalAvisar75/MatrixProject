//
//  SmoothFlowLayout.swift
//  MatrixProject
//
//  Created by eyal avisar on 01/08/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import UIKit

class SmoothFlowLayout: UICollectionViewFlowLayout {
    let activeDistance: CGFloat = 200
    
    override init() {
        super.init()
        scrollDirection = .horizontal
        minimumLineSpacing = 40
        itemSize = CGSize(width: 150, height: 150)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        
        guard let collectionView = collectionView else {return .zero}
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.frame.width, height: collectionView.frame.height)
        
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        
        let rightEdge = proposedContentOffset.x + collectionView.frame.width
        
        
        guard let rectAttributes = super.layoutAttributesForElements(in: targetRect) else {return .zero}
        
        for attributes in rectAttributes {
            let itemRightEdge = attributes.frame.maxX
            
            if (itemRightEdge - (rightEdge - itemSize.width - minimumLineSpacing)).magnitude < offsetAdjustment.magnitude {
                offsetAdjustment = itemRightEdge - (rightEdge - itemSize.width - minimumLineSpacing)
            }
        }

        
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }
}
