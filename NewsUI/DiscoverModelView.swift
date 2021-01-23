//
//  DiscoverModelView.swift
//  NewsUI
//
//  Created by MacBook on 20.01.2021.
//
import UIKit

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
    
    
    
    
    func setHeader(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "CollectionReusableView",for: indexPath) as! CollectionReusableView
            return view
        case 1:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "DiscoverCollectionViewCell",for: indexPath) as! DiscoverCollectionViewCell
            return view
        case 2:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "DiscoverTitleCVCell",for: indexPath) as! DiscoverTitleCVCell
            return view
        case 3:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "DiscoverCollectionViewCell",for: indexPath) as! DiscoverCollectionViewCell
            return view
        case 4:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "DiscoverTitleCVCell",for: indexPath) as! DiscoverTitleCVCell
            return view
        default:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "DiscoverTitleCVCell",for: indexPath) as! DiscoverTitleCVCell
            return view
        }
    }
    
    func cellForItemAt (_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row >= 0 && indexPath.row <= 4 && indexPath.section == 0 {
            let discoverCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverNewsCell", for: indexPath) as! DiscoverNewsCell
            return discoverCell
        } else if indexPath.row >= 0 && indexPath.row <= 2 && indexPath.section == 1{
            let authorCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthorCell", for: indexPath) as! AuthorCollectionViewCell
            return authorCell
        } else if indexPath.row >= 0 && indexPath.row <= 4 && indexPath.section == 2{
            let fashionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FashionCell", for: indexPath) as! FashionCollectionViewCell
            return fashionCell
        } else if indexPath.row >= 0 && indexPath.row <= 2 && indexPath.section == 3{
            let discoverCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverCell", for: indexPath) as! DiscoverCVCell
            return discoverCell
        } else if indexPath.row >= 0 && indexPath.row <= 4 && indexPath.section == 4{
            let mustSeeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MustSeeCell", for: indexPath) as! MustSeeCollectionViewCell
            return mustSeeCell
        } else if indexPath.row >= 0 && indexPath.row <= 3 {
                let discoverCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverCell", for: indexPath) as! DiscoverCVCell
                return discoverCell
        }
        
        return UICollectionViewCell()
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            
            case 0: return self.firstLayoutSection()
            case 1: return self.secondLayoutSection()
            case 2: return self.thirdLayoutSection()
            case 3: return self.fourthLayoutSection()
            case 4: return self.fivethLayoutSection()
            default: return self.fourthLayoutSection()
            }
        }
    }



    func firstLayoutSection() -> NSCollectionLayoutSection {

       let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
    .fractionalHeight(1))

       let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets.bottom = 15

       let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension:
    .fractionalWidth(1))

       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    group.contentInsets = .init(top: 0, leading: 15, bottom: 10, trailing: 2)

       let section = NSCollectionLayoutSection(group: group)

       section.orthogonalScrollingBehavior = .groupPaging
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        ]

       return section
    }
    
    func secondLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
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
    
    func thirdLayoutSection() -> NSCollectionLayoutSection {

       let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                                                .fractionalHeight(1))

       let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets.bottom = 15

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension:
                                                .fractionalWidth(0.7))

       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)

       let section = NSCollectionLayoutSection(group: group)

       section.orthogonalScrollingBehavior = .groupPaging
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        ]

       return section
    }
    
    func fourthLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.35))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 0)
       
        let section = NSCollectionLayoutSection(group: group)
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        ]
        
        return section
    }
    func fivethLayoutSection() -> NSCollectionLayoutSection {

       let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
    .fractionalHeight(1))

       let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets.bottom = 15

       let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension:
                                                .fractionalWidth(0.6))

       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    group.contentInsets = .init(top: 10, leading: 15, bottom: 0, trailing: 2)

       let section = NSCollectionLayoutSection(group: group)

       section.orthogonalScrollingBehavior = .groupPaging
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        ]

       return section
    }
    


}

