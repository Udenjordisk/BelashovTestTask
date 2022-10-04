//
//  CollectionCell.swift
//  BelashovTestTask
//
//  Created by Кирилл on 03.10.2022.
//

import UIKit

class CollectionCell: UICollectionViewCell, ConfigurableCell {
    
    static let identifier = "CollectionCell"
    
    var model: Model?
    
    var section = 0
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
       
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        
        collection.allowsMultipleSelection = true
        collection.showsHorizontalScrollIndicator = false
        
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
   
    func configure(model: Model, indexPath: IndexPath){
        
        self.model = model
        
        self.section = (indexPath.section - 1) / 2
        
    }
    
}

extension CollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model?.sections[section].itemsToShow ?? 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell else {fatalError()}
        
        cell.currentSection = self.section
        cell.configure(model: model! , indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = Double.random(in: 140...190)
        
        return CGSize(width: width, height: contentView.frame.height)
    }
    
    //MARK: - Select and deselect cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard selectedItems.count < 6 else {
            
            self.window?.rootViewController?.present(showAlert(), animated: true, completion: nil)
            
            return
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as! SelectableCell
        
        cell.selectCell(model: model!, indexPath: indexPath)
        
       
        
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SelectableCell

        cell.deselectCell(model: model!, indexPath: indexPath)
    }
    
  
    
}
