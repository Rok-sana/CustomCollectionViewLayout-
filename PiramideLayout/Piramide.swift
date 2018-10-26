//
//  Piramide.swift
//  PiramideLayout
//
//  Created by swstation on 8/7/18.
//  Copyright © 2018 swstation. All rights reserved.
//

import UIKit

class Piramide: UICollectionViewLayout {
    
    var cache: [IndexPath : UICollectionViewLayoutAttributes] = [:]
    
    private var cellW = 70.0; private var cellH = 70.0
     private var base = 5.0
    
    
    override var collectionViewContentSize: CGSize {
        guard collectionView != nil else {
            return .zero        }
        _ = 0.0
        let w = base * cellW  * 2
        let h = base * cellH * 2 
        
        
        return CGSize(width: w, height: h)
    }
    
    override func prepare() {
        super.prepare()
        cache.removeAll()
        
        guard let `collectionView` = collectionView else {
            return
        }
       
        let items = collectionView.numberOfItems(inSection: 0)
        
        var y = Double(collectionViewContentSize.height) - cellH
        let centerX = Double(collectionViewContentSize.width) / 2
        
        var itemsPerRow = 1
        var counter = 0
         var maxCounter = 5
        for item in 0..<items{
            let indexPath = IndexPath(item: item, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            let minX = centerX - Double(itemsPerRow) * cellW / 2
            let currentX = minX + Double(counter) * cellW
            
            let frame = CGRect(x: CGFloat(currentX), y: CGFloat(y), width: CGFloat(cellW), height: CGFloat(cellH))
            
            attributes.frame = frame
            cache[indexPath] = attributes
        
         counter += 1
         
            
            if (counter >= itemsPerRow) &&  counter != maxCounter  {
                itemsPerRow += 1
                counter = 0
                y -= cellH
            }
            else if counter == maxCounter {
                itemsPerRow -= 1
                counter = 0
                y -= cellH
                maxCounter -= 1
                
            }
           
            
        }
        
    
    }
    
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes = super.layoutAttributesForElements(in: rect) ?? []
        
        for attribute in cache.values {
            if attribute.frame.intersects(rect) {
                attributes.append(attribute)
            }
        }
        
        return attributes
    }
}


