//
//  Products.swift
//  Thunder_Store
//
//  Created by loay on 28/01/2023.
//

import Foundation

struct Products: Codable {

  var id                 : Int?
  var title              : String?
  var description        : String?
  var price              : Int?
  var discountPercentage : Double?
  var rating             : Double?
  var stock              : Int?
  var brand              : String?
  var category           : String?
  var thumbnail          : String?
  var images             : [String]?

  enum CodingKeys: String, CodingKey {

    case id                 = "id"
    case title              = "title"
    case description        = "description"
    case price              = "price"
    case discountPercentage = "discountPercentage"
    case rating             = "rating"
    case stock              = "stock"
    case brand              = "brand"
    case category           = "category"
    case thumbnail          = "thumbnail"
    case images             = "images"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id                 = try values.decodeIfPresent(Int.self      , forKey: .id                 )
    title              = try values.decodeIfPresent(String.self   , forKey: .title              )
    description        = try values.decodeIfPresent(String.self   , forKey: .description        )
    price              = try values.decodeIfPresent(Int.self      , forKey: .price              )
    discountPercentage = try values.decodeIfPresent(Double.self   , forKey: .discountPercentage )
    rating             = try values.decodeIfPresent(Double.self   , forKey: .rating             )
    stock              = try values.decodeIfPresent(Int.self      , forKey: .stock              )
    brand              = try values.decodeIfPresent(String.self   , forKey: .brand              )
    category           = try values.decodeIfPresent(String.self   , forKey: .category           )
    thumbnail          = try values.decodeIfPresent(String.self   , forKey: .thumbnail          )
    images             = try values.decodeIfPresent([String].self , forKey: .images             )
 
  }

  init() {

  }

}
