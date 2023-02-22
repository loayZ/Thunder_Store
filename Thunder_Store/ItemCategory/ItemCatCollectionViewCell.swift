//
//  ItemCatCollectionViewCell.swift
//  test
//
//  Created by loay on 16/01/2023.
//

import UIKit

class ItemCatCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var ItemImg: UIImageView!
    @IBOutlet weak var ItemLbl: UILabel!
    @IBOutlet weak var ItemPrice: UILabel!
    @IBOutlet weak var FavButt: UIButton!
    func setText(){
        FavButt.setTitle("", for: .normal)
    }
    func setup(with itemcat: ItemCat) {
        ItemImg.image = itemcat.image
        ItemLbl.text = itemcat.title
        ItemPrice.text = itemcat.price
        
    }
    func setup(with products: Product3) {
        ItemImg.image = UIImage(named: "AppIcon")
        ItemLbl.text = products.title
        var convertString : String = String(products.price ?? 0)
        ItemPrice.text = convertString
    }
        func setup(with products2: Product) {
            ItemImg.image = UIImage(named: "AppIcon")
            ItemLbl.text = products2.title
            var convertString : String = String(products2.price ?? 0)
            ItemPrice.text = convertString
            
        }
    func setup(with products3: Product4) {
        ItemImg.image = UIImage(named: "AppIcon")
        ItemLbl.text = products3.title
        var convertString : String = String(products3.price ?? 0)
        ItemPrice.text = convertString
        
    }
        
    }
    
