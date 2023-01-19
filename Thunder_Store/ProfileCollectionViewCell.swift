//
//  ProfileCollectionViewCell.swift
//  test
//
//  Created by loay on 11/01/2023.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

/*
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var staticlogo: UIImageView!
  */
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var staticlogo: UIImageView!
    
    func setup(with profileLinkItem: ProfileLinkItem) {
        logo.image = profileLinkItem.icon
        title.text = profileLinkItem.title
        staticlogo.image = profileLinkItem.CRicon
        
        
    }
    
}
    

