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
        searchCollectionView.collectionViewLayout = searchViewModel.createCompositionalLayout()
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
        
        searchViewModel.cellForItemAt(collectionView, indexPath: indexPath)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        let view = searchViewModel.setHeader(collectionView: collectionView, viewForSupplementaryElementOfKind: kind, indexPath: indexPath)
        
        return view
        
       
    }
    
}
