//
//  CustomTableViewCell.swif
//  AlmofireTestingApp
//
//  Created by hasher on 22/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    
    //    @IBOutlet weak var wikiImageView: UIImageView!
//
//    @IBOutlet weak var titleLabel: UILabel!
//
//    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
