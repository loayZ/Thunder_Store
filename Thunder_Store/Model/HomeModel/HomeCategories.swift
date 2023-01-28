//
//  HomeCategories.swift
//  Thunder_Store
//
//  Created by loay on 28/01/2023.
//

import Foundation

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


