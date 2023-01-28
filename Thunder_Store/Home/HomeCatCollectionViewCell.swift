//
//  MovieCollectionViewCell.swift
//  CollectionViews
//
//  Created by Emmanuel Okwara on 28/06/2020.
//  Copyright © 2020 Macco. All rights reserved.
//

import UIKit

class HomeCatCollectionViewCell: UICollectionViewCell {
    
  //  @IBOutlet weak var movieImageView: UIImageView!
    //@IBOutlet weak var titleLbl: UILabel!
    
    
    @IBOutlet weak var HomeTitleLbl: UILabel!
    @IBOutlet weak var HomeMovieImageView: UIImageView!
    
    func setup(with homecat: HomeCat) {
        HomeMovieImageView.image = homecat.image
        HomeTitleLbl.text = homecat.title
    }
    
    func setup(with articles: Article) {
        HomeMovieImageView.image =  #imageLiteral(resourceName: "icons8-home-page-30")
        HomeTitleLbl.text = articles.title
    }
}
