//
//  CollectionViewCell.swift
//  NewsUI
//
//  Created by MacBook on 13.01.2021.
//

import UIKit

class TodayNewsCollectionViewCell: UICollectionViewListCell {
    

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    
    imageRound(image: userImageView)
                
 
 
   
    }
    
 
    
    
}

extension TodayNewsCollectionViewCell {
    
    func imageRound (image: UIImageView) {
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
    
}
