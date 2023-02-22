//
//  NewItemsCollectionViewCell.swift
//  Thunder_Store
//
//  Created by loay on 25/01/2023.
//

import UIKit

class NewItemsCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var ItemImg: UIImageView!
    
    @IBOutlet weak var ItemLbl: UILabel!
    
    @IBOutlet weak var ItemPrice: UILabel!
    @IBOutlet weak var FavButt: UIButton!
    
    func setText(){
        FavButt.setTitle("", for: .normal)
    }
    func setup(with productimg: productImg) {
        //ItemImg.image = productimg.img1
    print(productimg.img1)
    }
    func setup(with products: Product) {
        ItemImg.image =  #imageLiteral(resourceName: "Logo")
        ItemLbl.text = products.title
        var convertString : String = String(products.price ?? 0)
        ItemPrice.text = convertString
        var Id = products.id
    }
}

