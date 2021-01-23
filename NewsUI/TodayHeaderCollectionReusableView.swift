//
//  TodayHeaderCollectionReusableView.swift
//  NewsUI
//
//  Created by MacBook on 19.01.2021.
//

import UIKit

class TodayHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "TodayHeaderCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        label.textColor = .white
        return label
    } ()
        
    public func configure () {
        backgroundColor = .systemGray
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
