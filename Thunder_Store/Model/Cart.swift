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
    Cart(title: "Anker PowerBank MagSafe", image: #imageLiteral(resourceName: "Anker_Magnetic_Battery"), price: "34.99"),
    Cart(title: "AUX Cable", image: #imageLiteral(resourceName: "Anker_AUX"), price: "5"),
    Cart(title: "Anker Charger", image: #imageLiteral(resourceName: "Anker_PowerPort"), price: "25"),
    Cart(title: "Type-C Cable", image: #imageLiteral(resourceName: "Anker_cable"), price: "12.99")
  
]
