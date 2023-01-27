//
//  CartCollectionViewCell.swift
//  Thunder_Store
//
//  Created by loay on 19/01/2023.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var itemImg: UIImageView!
    
    @IBOutlet weak var itemLbl: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var trashButt: UIButton!
    
    func setText(){
        trashButt.setTitle("", for: .normal)
    }
    
    func setup(with carts : Cart){
        
       itemImg.image = carts.image
        itemLbl.text = carts.title
        itemPrice.text = carts.price
    }
}
