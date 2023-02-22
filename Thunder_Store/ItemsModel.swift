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
    //  let images : [productImg]?
    
}

struct productImg : Decodable{
    
    let img1 : String?
    let img2 : String?
    let img3 : String?
    let img4 : String?
    let img5 : String?
    
}
struct TopSelling : Decodable {

     
      let total    : Int?
      let limit    : Int?
      let skip     : Int?
      let products : [Product2]
    
}

struct Product2 : Decodable{
    
    
      let id    : Int?
      let title : String?
      let price : Int?
     // let images : [String]?
    
}


struct Catproduct : Decodable {

     
      let total    : Int?
      let limit    : Int?
      let skip     : Int?
      let products : [Product3]
    
}

struct Product3 : Decodable{
    
    
      let id    : Int?
      let title : String?
      let price : Int?
     // let images : [String]?
    
}

struct Topsellingproduct : Decodable {

     
      let total    : Int?
      let limit    : Int?
      let skip     : Int?
      let products : [Product4]
    
}

struct Product4 : Decodable{
    
    
      let id    : Int?
      let title : String?
      let price : Int?
     // let images : [String]?
    
}







struct Items: Decodable {
    
    let id                 : Int?
    let title              : String?
    let description        : String?
    let price              : Int?
    //let images             : [productImg]?
   /* var discountPercentage : Double?
    var rating             : Double?
    var stock              : Int?
    var brand              : String?
    var category           : String?
    var thumbnail          : String?
   
    */
}
/////////////////////////////////////////////////////////////////////////////
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

/*
struct Product2 : Decodable{
    
    
      let id    : Int?
      let title : String?
      let price : Int?
     //  let images : [String]?
    
}
*/
