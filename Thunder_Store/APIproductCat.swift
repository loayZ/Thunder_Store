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
    func  didFetchNewItems(homeCategories: HomeCategories)
    func  didFetchTopsellingproduct(topsellingproducts: Topsellingproduct)
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
    func fetchNewItems ()
        {
          
            let urlString = "https://dummyjson.com/products?limit=50&skip=10&select=title,price"
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
                    let thisposts = try JSONDecoder().decode(HomeCategories.self, from: data!)
                   
                    delegate?.didFetchNewItems(homeCategories: thisposts)
                    
                }
                catch
                {
                    print(error)
                }
                
            }
            
        }
        task.resume()


        }
    
    func fetchTopsellingItems ()
        {
          
            let urlString = "https://dummyjson.com/products?limit=50&skip=20&select=title,price"
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
                    let thisposts = try JSONDecoder().decode(Topsellingproduct.self, from: data!)
                   
                    delegate?.didFetchTopsellingproduct(topsellingproducts: thisposts)
                    
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

