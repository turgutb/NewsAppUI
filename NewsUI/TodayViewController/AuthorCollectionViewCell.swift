//
//  AuthorCollectionViewCell.swift
//  NewsUI
//
//  Created by MacBook on 20.01.2021.
//

import UIKit

class AuthorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2

        self.profileImage.clipsToBounds = true

        self.profileImage.layer.borderColor = UIColor.white.cgColor

        self.profileImage.layer.borderWidth = 5
    }

}
