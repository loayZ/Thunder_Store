//
//  TextField.swift
//  Sahlah
//
//  Created by loay on 05/02/2023.
//

import Foundation
import UIKit


extension UITextField {
    
    func setIcon(_ image: UIImage) {
       let iconView = UIImageView(frame:
                      CGRect(x: 20, y: 15, width: 20, height: 20))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 30, y: 0, width: 50, height: 50))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
    }

}
