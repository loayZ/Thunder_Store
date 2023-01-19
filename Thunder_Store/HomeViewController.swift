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
    //MARK: Upper icons
    
    @IBOutlet weak var notification: UIButton!
    
    //MARK: Item CollectionView
    @IBOutlet weak var ItemcollectionView: UICollectionView!
    
    //MARK: slideShow
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    //MARK: CollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: upper icons
      notification.setTitle("", for: .normal)
     
        //MARK: collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
       /*
        //MARK: Item collectionView
        ItemcollectionView.dataSource = self
        ItemcollectionView.delegate = self
        ItemcollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let layoutItem = ItemcollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layoutItem.scrollDirection = .horizontal
        */
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
        
         /*let recognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.didTap))
            slideshow.addGestureRecognizer(recognizer)
*/
          }
   
    
    /*@objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    */
}
//MARK: Image slide
extension HomeViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
       
    }
}

// MARK: collectionView---------

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homecats.count
    }
    //Item collectionView
    /*func ItemcollectionView(_ ItemcollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemcats.count
     }
*/
     
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCatCollectionViewCell", for: indexPath) as! HomeCatCollectionViewCell
        cell.setup(with: homecats[indexPath.row])
        return cell
    }
    
    
    /*func ItemcollectionView(_ ItemcollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ItemcollectionView.dequeueReusableCell(withReuseIdentifier: "ItemCatCollectionViewCell", for: indexPath) as! ItemCatCollectionViewCell
        cell.setup(with: itemcats[indexPath.row])
        return cell
    }
     */
}


    
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
   /* func ItemcollectionView(_ ItemcollectionView: UICollectionView, layout ItemcollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    */
}


extension HomeViewController: UICollectionViewDelegate {
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    var Lbldata = homecats[indexPath.row].title

    
    print(homecats[indexPath.row].title)
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(identifier: "Item") as! ItemCatViewController
    vc.modalPresentationStyle = .overFullScreen
    vc.passLblData = Lbldata
    present(vc, animated : true)
}
    /*func ItemcollectionView(_ ItemcollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(itemcats[indexPath.row].title)
    }
    */
}


