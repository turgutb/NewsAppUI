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
    
    func setHeader(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "SearchHeaderCell",for: indexPath) as! SearchHeaderCell
            return view
        case 1:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "CategoryCell",for: indexPath) as! CategoryViewCell
            return view
        default:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "CategoryCell",for: indexPath) as! CategoryViewCell
            return view
        }
    }
    
    func cellForItemAt (_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row >= 0 && indexPath.row <= 5 && indexPath.section == 0 {
            let discoverCell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryViewCell", for: indexPath) as! CategoryCollectionViewCell
            return discoverCell
        } else if indexPath.row >= 0 && indexPath.row <= 3 && indexPath.section == 1 {
            let tomorrowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TomorrowCell", for: indexPath) as! TomorrowCollectionViewCell
            return tomorrowCell
        } else if indexPath.row >= 0 && indexPath.row <= 3 && indexPath.section == 2 {
            let tomorrowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TomorrowCell", for: indexPath) as! TomorrowCollectionViewCell
            return tomorrowCell
        }
        
        return UICollectionViewCell()
    }
  
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            
            case 0: return self.firstLayoutSection()
            case 1: return self.secondLayoutSection()
            default: return self.secondLayoutSection()

            }
        }
    }



    func firstLayoutSection() -> NSCollectionLayoutSection {
    
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.33))
    
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets = .init(top: 20, leading: 0, bottom: 10, trailing: 15)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
   
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets.leading = 15
    
    section.boundarySupplementaryItems = [
        NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    ]
    
    return section
}
    
    func secondLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.6))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 20, leading: 0, bottom: 10, trailing: 15)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 15
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        ]
        
        return section
    }
    


}
