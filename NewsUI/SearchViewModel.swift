//
//  SearchViewModel.swift
//  NewsUI
//
//  Created by MacBook on 22.01.2021.
//

import UIKit

class SearchViewModel {
    
    func numberOfSection() -> Int {
        return 2
    }
    
    func setSection(numberOfItemsInSection section: Int) -> Int {
        switch section {
        
            case 0:
                return 6
            case 1:
                return 6
            default:
                return 6
        }
    }
}
