//
//  CategoriesCollectionViewCell.swift
//  Thunder_Store
//
//  Created by loay on 18/01/2023.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
   @IBOutlet weak var ItemImg : UIImageView!
   @IBOutlet weak var ItemLbl : UILabel!
    
    
    func setup(with categories : Categories){
        
        ItemImg.image = categories.image
        ItemLbl.text = categories.title
        
    }
    
    
    
    
}
