//
//  TodayModelView.swift
//  NewsUI
//
//  Created by MacBook on 20.01.2021.
//

import UIKit

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
    
    func setHeader(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "CollectionReusableView",for: indexPath) as! CollectionReusableView
        
        
        return view
    }
    
    func cellForItemAt (_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row >= 0 && indexPath.row <= 2 && indexPath.section == 0 {
            let todayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! TodayNewsCollectionViewCell
            return todayCell
        } else if indexPath.row >= 0 && indexPath.row <= 5 && indexPath.section == 1{
            let tomorrowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TomorrowCell", for: indexPath) as! TomorrowCollectionViewCell
            return tomorrowCell
        } else if indexPath.row >= 0 && indexPath.row <= 5 && indexPath.section == 2{
            let tomorrowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsDetailCollectionViewCell", for: indexPath) as! NewsDetailCollectionViewCell
            return tomorrowCell
        }
        return UICollectionViewCell()
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            
            case 0: return self.firstLayoutSection()
            case 1: return self.secondLayoutSection()
            default: return self.thirdLayoutSection()
          
            }
        }
    }

    private func firstLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 25
        
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalWidth(1))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 10, leading: 50, bottom: 0, trailing: 2)
       
        let section = NSCollectionLayoutSection(group: group)
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        ]
        
        return section
    }

    private func secondLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.6))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 10, leading: 0, bottom: 5, trailing: 15)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 15
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        ]
        
        return section
    }

    private func thirdLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.35))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
       
        let section = NSCollectionLayoutSection(group: group)
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        ]
        
        return section
    }
}
