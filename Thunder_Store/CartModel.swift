//
//  CartModel.swift
//  Thunder_Store
//
//  Created by loay on 22/02/2023.
//

import Foundation


struct CartItems: Codable {

  let carts : [Carts]?
  let total : Int?
  let skip  : Int?
  let limit : Int?
    
    }

    struct Carts: Codable {
        
        let id              : Int?
        let products        : [Products5]?
        let total           : Int?
        //let userId          : Int?
        //let totalProducts   : Int?
       // let totalQuantity   : Int?
    }

struct Products5: Codable {
    
    let id                 : Int?
    let title              : String?
    let price              : Int?
    //let quantity           : Int?
   // let total              : Int?
    //let discountPercentage : Double?
    //let discountedPrice    : Int?
}
