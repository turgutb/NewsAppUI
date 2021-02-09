//
//  TodayModelView.swift
//  NewsUI
//
//  Created by MacBook on 20.01.2021.
//


class TodayModelView {
    
    
    func numberOfSection() -> Int {
        return 3
    }
    
    func setSection(numberOfItemsInSection section: Int) -> Int {
        switch section {
        
            case 0:
                return 3
            case 1:
                return 6
            default:
                return 6
        }
    }
    
   
}
    
   
