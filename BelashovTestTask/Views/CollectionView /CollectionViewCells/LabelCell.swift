//
//  LabelCell.swift
//  BelashovTestTask
//
//  Created by Кирилл on 03.10.2022.
//

import UIKit

class LabelCell: UICollectionViewCell, ConfigurableCell {
    
    static let identifier = "LabelCell"
    
    var label = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    func configure(model: Model, indexPath: IndexPath){
        
        let section = (indexPath.section + 1) / 2
                
        self.label.text = model.sections[section].header
        
        configureLabel()
        
    }
    
    
    private func configureLabel(){
        
        contentView.addSubview(label)
        
        label.textColor = .label
        
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
    }

}

