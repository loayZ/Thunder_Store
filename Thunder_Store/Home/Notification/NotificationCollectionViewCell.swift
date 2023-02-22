//
//  NotificationCollectionViewCell.swift
//  Thunder_Store
//
//  Created by loay on 31/01/2023.
//

import UIKit

class NotificationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var timeLbl: UILabel!
    
    @IBOutlet weak var subtitlelbl: UILabel!
    
    
    func setup(with notifications : Notification){
        titleLbl.text = notifications.title
        dateLbl.text = notifications.date
        timeLbl.text = notifications.time
        subtitlelbl.text = notifications.subTitle
    }
}
