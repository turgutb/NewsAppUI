//
//  CategoriesViewController.swift
//  NewsUI
//
//  Created by MacBook on 13.01.2021.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var categoriesViewModel: CategoriesViewModel = CategoriesViewModel()

    @IBOutlet var categoriesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      setConfigure()

    }
    
    private func setConfigure() {


        categoriesCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoryViewCell")
        
        categoriesCollectionView.register(UINib(nibName: "TomorrowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TomorrowCell")
        
        categoriesCollectionView.register(UINib(nibName: "CategoryViewCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CategoryCell")
        
        categoriesCollectionView.register(UINib(nibName: "SearchHeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchHeaderCell")
        

        categoriesCollectionView.delegate = self
        
        categoriesCollectionView.reloadData()
        
        categoriesCollectionView.collectionViewLayout = categoriesViewModel.createCompositionalLayout()
        
    }

    

}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        categoriesViewModel.numberOfSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        categoriesViewModel.setSection(numberOfItemsInSection: section)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        categoriesViewModel.cellForItemAt(collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        let view = categoriesViewModel.setHeader(collectionView: collectionView, viewForSupplementaryElementOfKind: kind, indexPath: indexPath)


        return view

    }
}
