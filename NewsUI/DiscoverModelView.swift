//
//  DiscoverModelView.swift
//  NewsUI
//
//  Created by MacBook on 20.01.2021.


class DiscoverModelView {
    
    
    func numberOfSection() -> Int {
        return 6
    }
    
    
    func setSection(numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        
            case 0:
                return 5
            case 1:
                return 3
            case 2:
                return 5
            case 3:
                return 3
            case 4:
                return 4
            default:
                return 4
            
        }
    }
    

}
  
    
   
