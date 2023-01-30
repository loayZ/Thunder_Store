//
//  APIItems.swift
//  Thunder_Store
//
//  Created by loay on 30/01/2023.
//

import Foundation

var getItemId : Int = 0

protocol ItemdataDelegate {
    func  didFetchItem(item: Items)
    func didFailWithError (error : Error?)
}

struct Itemdata{
    
    var delegate:ItemdataDelegate?
    
    func fetchItem ()
        {
          
            let urlString = "https://dummyjson.com/products/\(getItemId)"
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
                    let thisposts = try JSONDecoder().decode(Items.self, from: data!)
                   
                    delegate?.didFetchItem(item: thisposts)
                    
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


