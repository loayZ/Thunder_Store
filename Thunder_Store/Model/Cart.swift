//
//  Cart.swift
//  Thunder_Store
//
//  Created by loay on 19/01/2023.
//


import UIKit

struct Cart {
    let title: String
    let image: UIImage
    let price: String
}

let carts: [Cart] = [
    Cart(title: "Mobile Accessories", image: #imageLiteral(resourceName: "icons8-smartphones-96"), price: "11.99"),
    Cart(title: "PC Accesories", image: #imageLiteral(resourceName: "icons8-workstation-100"), price: "5"),
    Cart(title: "Smart Watches", image: #imageLiteral(resourceName: "icons8-smart-watch-100 (1)"), price: "25"),
    Cart(title: "Smart Watches", image: #imageLiteral(resourceName: "icons8-smart-watch-100 (1)"), price: "25")
  
]
