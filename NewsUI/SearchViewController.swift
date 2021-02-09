//
//  SearchViewController.swift
//  NewsUI
//
//  Created by MacBook on 13.01.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    let searchViewModel: SearchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        
    }
    
    
    private func configureUI() {
        
        searchCollectionView.register(UINib(nibName: "PopularTagsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularTagsCollectionViewCell")
        searchCollectionView.register(UINib(nibName: "PopularCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCell")
        
        
        searchCollectionView.register(UINib(nibName: "SearchHeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchHeaderCell")
        searchCollectionView.delegate = self
        searchCollectionView.reloadData()
        searchCollectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            
            case 0: return searchCategory()
            case 1: return search()
            default: return search()
                
            }
        }
    }
    
    
}




extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return searchViewModel.numberOfSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        searchViewModel.setSection(numberOfItemsInSection: section)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row >= 0 && indexPath.row <= 5 && indexPath.section == 0 {
            let todayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCategoriesCollectionViewCell
            return todayCell
        } else if indexPath.row >= 0 && indexPath.row <= 5 && indexPath.section == 1{
            let tomorrowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularTagsCollectionViewCell", for: indexPath) as! PopularTagsCollectionViewCell
            return tomorrowCell
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "SearchHeaderCell",for: indexPath) as! SearchHeaderCell
            return view
        default:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "SearchHeaderCell",for: indexPath) as! SearchHeaderCell
            return view
        }
        
    }
}
