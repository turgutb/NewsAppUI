
import Foundation
import UIKit


func wideDetailGrid() -> NSCollectionLayoutSection {
    
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

func newsGrid() -> NSCollectionLayoutSection {
    
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

func categoriesGrid() -> NSCollectionLayoutSection {
    
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

func newsDetail() -> NSCollectionLayoutSection {
    
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

func horizontalNews() -> NSCollectionLayoutSection {
    
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

func popularAuthor() -> NSCollectionLayoutSection {
    
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

func horizontalPopularAuthor() -> NSCollectionLayoutSection {
    
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets.bottom = 15
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalWidth(0.7))
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)
    
    let section = NSCollectionLayoutSection(group: group)
    
    section.orthogonalScrollingBehavior = .groupPaging
    
    section.boundarySupplementaryItems = [
        NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    ]
    
    return section
}

func authorNewsDetail() -> NSCollectionLayoutSection {
    
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


func searchCategory() -> NSCollectionLayoutSection {
    
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

func search() -> NSCollectionLayoutSection {
    
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
