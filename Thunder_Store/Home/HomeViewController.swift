//
//  HomeViewController.swift
//  test
//
//  Created by loay on 27/12/2022.
//
import UIKit
import ImageSlideshow


class HomeViewController: UIViewController{

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK: API
    var articles=[Article(title:"",description:"")]
    var products=[Product(id: 0, title: "", price: 0)]
   // var products2=[Product2(id: 0, title: "", price: 0)]
    //MARK: Upper icons
    
    @IBOutlet weak var notification: UIButton!
    
    //MARK: Item CollectionView
    @IBOutlet weak var ItemcollectionView: UICollectionView!
    
    
    @IBOutlet weak var topsellingCollectionView: UICollectionView!
    
    //MARK: slideShow
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    //MARK: CollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Buttons
    
    @IBAction func NewViewAll(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Item") as! ItemCatViewController
        vc.modalPresentationStyle = .currentContext
        present(vc, animated : true)
    }
    
    @IBAction func TopSellViewAll(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Item") as! ItemCatViewController
        vc.modalPresentationStyle = .currentContext
        present(vc, animated : true)
    }
    
    @IBAction func notification(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "notification") as! NotificationViewController
        vc.modalPresentationStyle = .currentContext
        present(vc, animated : true)
    }
    // MARK: API
    var newsAPI = NewsApi()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: upper icons
      notification.setTitle("", for: .normal)
        
        initCollectionVC()
        
       
        //MARK: SlideShow
        slideshow.slideshowInterval = 5.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .bottom)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.pageIndicator = pageControl
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self
        
        slideshow.setImageInputs(ImgSlide())
        
        // MARK: API
        
        newsAPI.delegate=self
          newsAPI.fetchNews()
        newsAPI.fetchNewItems()
        newsAPI.fetchTopSelling()
        
          }
   
    
}
//MARK: Image slide
extension HomeViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
       
    }
}

// MARK: collectionView---------

extension HomeViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func initCollectionVC(){
        //MARK: collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        
        
        //MARK: catCollectionView
        ItemcollectionView.dataSource = self
        ItemcollectionView.delegate = self
        ItemcollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let Itemlayout = ItemcollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        Itemlayout.scrollDirection = .horizontal
        
        //MARK: topsellingCollectionView
        topsellingCollectionView.dataSource = self
        topsellingCollectionView.delegate = self
        topsellingCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let topsellinglayout = topsellingCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        topsellinglayout.scrollDirection = .horizontal
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == self.collectionView){
            return articles.count
        }
        else if(collectionView == ItemcollectionView){
            return products.count
        }
        else{
            return products.count
        }
        

        }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == self.collectionView){
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCatCollectionViewCell", for: indexPath) as! HomeCatCollectionViewCell
            cell.setup(with: articles[indexPath.row])
            return cell
            
        }else if (collectionView == ItemcollectionView){
            
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewItemsCollectionViewCell", for: indexPath) as! NewItemsCollectionViewCell
            cell.setup(with: products[indexPath.row])
            cell.setText()
            return cell
            
        }
        else{
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSellingCollectionViewCell", for: indexPath) as! TopSellingCollectionViewCell
            cell.setup(with: products[indexPath.row])
            cell.setText()
            return cell
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == self.collectionView){
            let availableWidth = (UIScreen.main.bounds.width - 70) / 2
            return CGSize(width: availableWidth, height: 120)
        }
        else{
            return CGSize(width: 182, height: 220)
        }
    }
}


//===========================================================================================
extension HomeViewController: UICollectionViewDelegate {
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    /*
    var Lbldata = homecats[indexPath.row].title

    print(homecats[indexPath.row].title)
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(identifier: "Item") as! ItemCatViewController
    vc.modalPresentationStyle = .overFullScreen
    vc.passLblData = Lbldata
    present(vc, animated : true)
*/
     }
     
}


extension HomeViewController:NewsAPIDelegate{
    
    
    func didFetchNewItems(homeCategories: HomeCategories) {
        print(homeCategories)
        
        products=homeCategories.products
        DispatchQueue.main.async{
            self.ItemcollectionView.reloadData()
        }
        ItemcollectionView.reloadData()
    }
    
    func didFetchTopSelling(topSelling: TopSelling) {
        print(topSelling)
        
        products=topSelling.products
        DispatchQueue.main.async{
            self.topsellingCollectionView.reloadData()
        }
        topsellingCollectionView.reloadData()
    }
    

    func didFetchPosts(posts: Posts) {
        print(posts)
        
        articles=posts.products
        DispatchQueue.main.async{
            self.collectionView.reloadData()
        }
        collectionView.reloadData()
        
    }
    
    func didFailWithError(error: Error?) {
        print(error!)
    }
}
