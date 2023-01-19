//
//  ProfileLinkItems.swift
//  test
//
//  Created by loay on 11/01/2023.
//

import UIKit

struct ProfileLinkItem{
    
    let icon : UIImage
    let title : String
    let CRicon : UIImage
    
}

let profileLinkItems: [ProfileLinkItem] = [
    ProfileLinkItem(icon : #imageLiteral(resourceName: "icons8-list-view-30 "), title : "Orders", CRicon : #imageLiteral(resourceName: "icons8-forward-30")),
    ProfileLinkItem(icon : #imageLiteral(resourceName: "icons8-favorite-30"), title:"Favourites", CRicon : #imageLiteral(resourceName: "icons8-forward-30")),
    ProfileLinkItem(icon : #imageLiteral(resourceName: "icons8-menu-rounded-30"), title:"Menu", CRicon : #imageLiteral(resourceName: "icons8-forward-30"))
    
]

