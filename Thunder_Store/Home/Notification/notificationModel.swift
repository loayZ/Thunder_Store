//
//  notificationModer.swift
//  Thunder_Store
//
//  Created by loay on 31/01/2023.
//

import Foundation

struct Notification {
    let title: String
    let subTitle : String
    let date : String
    let time : String
}

//var articles=[Article(title:"",description:"")]

let notifications: [Notification] = [
    Notification(title: "Check new deals!", subTitle: "big sales on various kinds of products", date: "5/1/2023", time: "11:25"),
    Notification(title: "Check new deals!", subTitle: "big sales on various kinds of products", date: "5/1/2023", time: "2:25"),
]

