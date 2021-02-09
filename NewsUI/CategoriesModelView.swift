//
//  CategoriesModelView.swift
//  NewsUI
//
//  Created by MacBook on 20.01.2021.
//

import UIKit

class CategoriesViewModel {
    
   
    
    func numberOfSection() -> Int {
        return 3
    }
    
    func setSection(numberOfItemsInSection section: Int) -> Int {
        switch section {
        
            case 0:
                return 6
            case 1:
                return 4
            default:
                return 4
        }
    }
    
}
