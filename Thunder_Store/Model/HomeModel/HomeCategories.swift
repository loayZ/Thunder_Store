//
//  HomeCategories.swift
//  Thunder_Store
//
//  Created by loay on 28/01/2023.
//

import Foundation

struct HomeCategories : Decodable {

     
      let total    : Int?
      let limit    : Int?
      let skip     : Int?
      let products : [Product]
    
}

struct Product : Decodable{
    
    
      let id    : Int?
      let title : String?
      let price : Int?
     //  let images : [String]?
    
}

struct TopSelling : Decodable {

     
      let total    : Int?
      let limit    : Int?
      let skip     : Int?
      let products : [Product]
    
}

struct Product2 : Decodable{
    
    
      let id    : Int?
      let title : String?
      let price : Int?
     //  let images : [String]?
    
}


struct Posts:Decodable {
    
    let total: Int
    let limit: Int
    let skip: Int //8
    let products: [Article] //8 content
    
}

struct Article: Decodable
{
    let title:String
    let description: String
//    let content : String
    
}


