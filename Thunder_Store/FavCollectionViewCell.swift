//
//  FavCollectionViewCell.swift
//  Thunder_Store
//
//  Created by loay on 01/02/2023.
//

import UIKit

class FavCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textLbl: UILabel!
    
    @IBOutlet weak var imgLbl: UIImageView!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var CartButt: UIButton!
    
    func setText(){
        CartButt.setTitle("", for: .normal)
    }
    
    func setup(with favs : Fav){
        textLbl.text = favs.title
        imgLbl.image = favs.image
        priceLbl.text = favs.price
    }
}
