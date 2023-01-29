import Foundation


protocol NewsAPIDelegate  {
    func  didFetchPosts(posts: Posts)
    func  didFetchNewItems(homeCategories: HomeCategories)
    func  didFetchTopSelling(topSelling: TopSelling)
    func didFailWithError (error : Error?)
    
}
struct NewsApi {

    var delegate:NewsAPIDelegate?

func fetchNews ()
    {

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
    
    func fetchNewItems ()
        {
          
            let urlString = "https://dummyjson.com/products?limit=10&skip=10&select=title,price"
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
    
    func fetchTopSelling ()
        {
          
            let urlString = "https://dummyjson.com/products?limit=20&skip=20&select=title,price"
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
                    let thisposts = try JSONDecoder().decode(TopSelling.self, from: data!)
                   
                    delegate?.didFetchTopSelling(topSelling: thisposts)
                    
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
