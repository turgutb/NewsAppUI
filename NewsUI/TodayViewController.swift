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
        configureUI()
    }
    
    
    private func configureUI () {
        
        
        todayCollectionView.register(UINib(nibName: "TodayNewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        todayCollectionView.register(UINib(nibName: "TomorrowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TomorrowCell")
        todayCollectionView.register(UINib(nibName: "NewsDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "newsDetailCollectionViewCell")
        todayCollectionView.register(UINib(nibName: "CollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView")
        
        

        todayCollectionView.delegate = self
        todayCollectionView.reloadData()
        todayCollectionView.collectionViewLayout = createCompositionalLayout()
    }
    
}

func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
    
    return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
        
        switch sectionNumber {
        
        case 0: return wideDetailGrid()
        case 1: return newsGrid()
        default: return newsDetail()
      
        }
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
    
    
func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "CollectionReusableView",for: indexPath) as! CollectionReusableView
        
        return view
        
    }
     
}
    







