//
//  NewsDetailCollectionViewCell.swift
//  NewsUI
//
//  Created by MacBook on 16.01.2021.
//

import UIKit

class NewsDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var editorName: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageRound(image: editorName)
        newsImage.layer.cornerRadius = 10
    }
    func imageRound (image: UIImageView) {
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
   

}
