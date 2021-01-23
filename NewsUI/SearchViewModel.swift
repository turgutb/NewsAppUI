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
    
    
    func setHeader(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "SearchHeaderCell",for: indexPath) as! SearchHeaderCell
            return view
        default:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "SearchHeaderCell",for: indexPath) as! SearchHeaderCell
            return view
        }
    }
    
    func cellForItemAt (_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row >= 0 && indexPath.row <= 5 && indexPath.section == 0 {
            let todayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCategoriesCollectionViewCell
            return todayCell
        } else if indexPath.row >= 0 && indexPath.row <= 5 && indexPath.section == 1{
            let tomorrowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularTagsCollectionViewCell", for: indexPath) as! PopularTagsCollectionViewCell
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
    item.contentInsets = .init(top: 20, leading: 0, bottom: 0, trailing: 15)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(175))
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
   
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets.leading = 15
    
    section.boundarySupplementaryItems = [
        NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    ]
    
    return section
}
    
    func secondLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 15)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 15
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        ]
        
        return section
    }
}
