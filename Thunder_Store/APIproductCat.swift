//
//  APIproductCat.swift
//  Thunder_Store
//
//  Created by loay on 31/01/2023.
//

import Foundation

var getCat = ""

protocol productCatdataDelegate {
    func  didFetchProduct(catproduct: Catproduct)
    func didFailWithError (error : Error?)
}

struct productCatdata{
    
    var delegate:productCatdataDelegate?
    
    func fetchProduct ()
        {
          
            let urlString = "https://dummyjson.com/products/category/\(getCat)"
        let url=URL(string : urlString)

        let urlSession=URLSession(configuration: .default)
                  
        let task=urlSession.dataTask(with: url!)
        {
            (data, urlResponse, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            }
            else
            {
            print(data)
                do {
                    let thisposts = try JSONDecoder().decode(Catproduct.self, from: data!)
                   
                    delegate?.didFetchProduct(catproduct: thisposts)
                    
                }
                catch
                {
                    print(error)
                }
                
            }
            
        }
        task.resume()


        }
}

