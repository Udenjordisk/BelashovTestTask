//
//  ImageCell.swift
//  BelashovTestTask
//
//  Created by Кирилл on 03.10.2022.
//

import UIKit

class ImageCell: UICollectionViewCell, ConfigurableCell{
    
    
    
    static let identifier = "ImageCell"
        
    var image: UIImage? = UIImage()
    var label = UILabel()
    var currentSection = 0
    var imageView = UIImageView()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        setupBlur()
        imageView.contentMode = .scaleAspectFill
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
  
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        contentView.layer.cornerRadius = contentView.frame.height/6
        setupBlur()
        setupLabel()
    }
   
    func configure(model: Model, indexPath: IndexPath){
        
        label.text = model.sections[currentSection].items[indexPath.item].title
        
        let imageURLString = model.sections[currentSection].items[indexPath.item].image.the1X

        let imageURL = URL(string: imageURLString)
        
        let dataTask = URLSession.shared.dataTask(with: imageURL!) { [weak self] (data, _, _) in
                if let data = data {
                    // Create Image and Update Image View
                    DispatchQueue.main.async {
                        self?.imageView.image = UIImage(data: data)
                    }
                    
                }
            }

        // Start Data Task
        dataTask.resume()
        
    }
    
    
    
    private func setupBlur(){
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        imageView.addSubview(blurEffectView)

        blurEffectView.heightAnchor.constraint(equalToConstant: imageView.frame.height/2.5).isActive = true
        blurEffectView.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        blurEffectView.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
       
    }
    
    private func setupLabel(){
        
        contentView.addSubview(label)
        
        label.textColor = .label
        
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.heightAnchor.constraint(equalToConstant: imageView.frame.height/2.5).isActive = true
        label.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
   
    
}

extension ImageCell: SelectableCell{
   
    func selectCell(model: Model, indexPath: IndexPath) {
                
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        
        
        selectedItems[model.sections[currentSection].items[indexPath.item].id] = model.sections[currentSection].items[indexPath.item]
        
    }
    
    func deselectCell(model: Model, indexPath: IndexPath) {
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.borderWidth = 1

        selectedItems.removeValue(forKey: model.sections[currentSection].items[indexPath.item].id)
        
        
    }
    
}

