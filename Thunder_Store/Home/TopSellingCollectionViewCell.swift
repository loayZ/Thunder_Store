//
//  TopSellingCollectionViewCell.swift
//  Thunder_Store
//
//  Created by loay on 25/01/2023.
//

import UIKit

class TopSellingCollectionViewCell: UICollectionViewCell {

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
}
