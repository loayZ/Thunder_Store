//
//  APIRequest.swift
//  Thunder_Store
//
//  Created by loay on 28/01/2023.
//

import Foundation


protocol NewsAPIDelegate  {
    func  didFetchPosts(posts: Posts)
    func didFailWithError (error : Error?)
    
}
struct NewsApi {

    var delegate:NewsAPIDelegate?

func fetchNews ()
    {
       // let urlString = "https://newsapi.org/v2/top-headlines?sources=google-news-sa&apiKey=6a79432ba1384bf08e4ca8cdd95a2c0c"
         

        let urlString = "https://dummyjson.com/products/category/smartphones"
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
                let thisposts = try JSONDecoder().decode(Posts.self, from: data!)
               
                delegate?.didFetchPosts(posts: thisposts)
                
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
