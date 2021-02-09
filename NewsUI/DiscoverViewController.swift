//
//  DiscoverViewController.swift
//  NewsUI
//
//  Created by MacBook on 13.01.2021.
//

import UIKit

class DiscoverViewController: UIViewController {
    var viewModel: DiscoverModelView = DiscoverModelView()
    
    @IBOutlet weak var discoverCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    private func configureUI () {
        
        discoverCollectionView.register(UINib(nibName: "DiscoverNewsCell", bundle: nil), forCellWithReuseIdentifier: "DiscoverNewsCell")
        discoverCollectionView.register(UINib(nibName: "AuthorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AuthorCell")
        discoverCollectionView.register(UINib(nibName: "FashionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FashionCell")
        discoverCollectionView.register(UINib(nibName: "DiscoverCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiscoverCollectionViewCell")
        discoverCollectionView.register(UINib(nibName: "DiscoverTitleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiscoverTitleCell")
        discoverCollectionView.register(UINib(nibName: "MustSeeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MustSeeCell")
        discoverCollectionView.register(UINib(nibName: "DiscoverCVCell", bundle: nil), forCellWithReuseIdentifier: "DiscoverCell")
        
        
        discoverCollectionView.register(UINib(nibName: "CollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView")
        discoverCollectionView.register(UINib(nibName: "DiscoverCollectionViewCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DiscoverCollectionViewCell")
        discoverCollectionView.register(UINib(nibName: "DiscoverTitleCVCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DiscoverTitleCVCell")
        
        
        discoverCollectionView.delegate = self
        discoverCollectionView.reloadData()
        discoverCollectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            
            case 0: return horizontalNews()
            case 1: return popularAuthor()
            case 2: return horizontalPopularAuthor()
            case 3: return authorNewsDetail()
            case 4: return horizontalPopularAuthor()
            default: return authorNewsDetail()
            }
        }
    }
}


extension DiscoverViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return viewModel.numberOfSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        viewModel.setSection(numberOfItemsInSection: section)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
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
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
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
}










