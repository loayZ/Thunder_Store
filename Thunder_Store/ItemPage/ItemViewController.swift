//
//  ItemViewController.swift
//  Thunder_Store
//
//  Created by loay on 19/01/2023.
//

import UIKit
import ImageSlideshow

class ItemViewController: UIViewController {

    
    var passLblData : String = ""
    var passId : Int = 0
    var items=[Items(id: 0, title: "",description: "", price: 0)]
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    @IBOutlet weak var favButt: UIButton!
    
    @IBOutlet weak var backButt: UIButton!
    
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    
    @IBOutlet weak var descriptionTxtV: UITextView!
    
    
    func setup(with items: Items) {
        titleLbl.text = items.title
        var convertString : String = String(items.price ?? 0)
        priceLbl.text = convertString
        var id = items.id
        descriptionTxtV.text = items.description
        
    }
    var API = Itemdata()
    override func viewDidLoad() {
        super.viewDidLoad()
        getItemId = passId
        
        //titleLbl.text = "\(passLblData)  \(String(passId))"
       // titleLbl.text = items
        backButt.setTitle("", for: .normal)
        favButt.setTitle("", for: .normal)
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
        
         let recognizer = UITapGestureRecognizer(target: self, action: #selector(ItemViewController.didTap))
            slideshow.addGestureRecognizer(recognizer)
        API.delegate=self
        API.fetchItem()
        
    }
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }

}
extension ItemViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
       
    }
}

extension ItemViewController : ItemdataDelegate {
    func didFetchItem(item: Items) {
       // print(item.images?[0])
        
        //titleLbl.text = item.images[]
        
//        titleLbl.text = item.title
//        var convertString : String = String(item.price ?? 0)
//        priceLbl.text = convertString
//        descriptionTxtV.text = item.description
        
        DispatchQueue.main.async{
            self.titleLbl.text = item.title
            var convertString : String = String(item.price ?? 0)
            self.priceLbl.text = convertString
            self.descriptionTxtV.text = item.description
        }
    
        }
    
    func didFailWithError(error: Error?) {
        print(error!)
    }
    
    
}
