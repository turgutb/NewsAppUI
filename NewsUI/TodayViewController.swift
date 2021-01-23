//
//  TodayViewController.swift
//  NewsUI
//
//  Created by MacBook on 13.01.2021.
//

import UIKit

class TodayViewController: UIViewController {
    
    var viewModel: TodayModelView = TodayModelView()
    @IBOutlet weak var todayCollectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfigure()
        
        

     
                
    }
    
    private func setConfigure () {
        todayCollectionView.register(UINib(nibName: "TodayNewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        todayCollectionView.register(UINib(nibName: "TomorrowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TomorrowCell")
        todayCollectionView.register(UINib(nibName: "NewsDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "newsDetailCollectionViewCell")
        todayCollectionView.register(UINib(nibName: "CollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView")

        todayCollectionView.delegate = self
        todayCollectionView.reloadData()
        todayCollectionView.collectionViewLayout = viewModel.createCompositionalLayout()
    }
    
}







extension TodayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        viewModel.numberOfSection()
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






