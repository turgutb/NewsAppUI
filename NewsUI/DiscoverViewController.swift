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
        discoverCollectionView.collectionViewLayout = viewModel.createCompositionalLayout()
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
        
        viewModel.cellForItemAt(collectionView, indexPath: indexPath)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        let view = viewModel.setHeader(collectionView: collectionView, viewForSupplementaryElementOfKind: kind, indexPath: indexPath)
        
        return view
        
       
    }
    
}







