//
//  ViewController.swift
//  BelashovTestTask
//
//  Created by Кирилл on 03.10.2022.
//

import UIKit

//MARK: - App work only with VPN

class CollectionViewController: UIViewController{
    
    //data model
    var model: Model?
    
    
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.identifier)
        collection.register(LabelCell.self, forCellWithReuseIdentifier: LabelCell.identifier)
        
        return collection
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        
        readJSON { [weak self] model in
            
            self?.model = model
            
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        
    }
    
    
}



extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //Sections count
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        (model?.sections.count ?? 4) * 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    //Cell settings
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.section % 2 != 0{
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell else {fatalError()}
            
            cell.configure(model: model!, indexPath: indexPath)
            
            return cell
            
        } else {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCell", for: indexPath) as? LabelCell else {fatalError()}
            
            cell.configure(model: model! , indexPath: indexPath)
            
            return cell
            
        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section % 2 != 0{
            
            let height = Double.random(in: 180...220)
            
            return CGSize(width: view.bounds.width, height: height)
        } else {
            return CGSize(width: view.bounds.width, height: 70)
        }
        
    }
    
}

