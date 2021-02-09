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

        configureUI()

    }
    
    private func configureUI() {


        categoriesCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoryViewCell")
        
        categoriesCollectionView.register(UINib(nibName: "TomorrowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TomorrowCell")
        
        categoriesCollectionView.register(UINib(nibName: "CategoryViewCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CategoryCell")
        
        categoriesCollectionView.register(UINib(nibName: "SearchHeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchHeaderCell")
        

        categoriesCollectionView.delegate = self
        
        categoriesCollectionView.reloadData()
        
        categoriesCollectionView.collectionViewLayout = createCompositionalLayout()
        
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            
            case 0: return categoriesGrid()
            case 1: return newsGrid()
            default: return newsGrid()

            }
        }
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
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
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
}
