//
//  ItemViewController.swift
//  Thunder_Store
//
//  Created by loay on 19/01/2023.
//

import UIKit
import ImageSlideshow

class ItemViewController: UIViewController {

    @IBOutlet weak var slideshow: ImageSlideshow!
    
    @IBOutlet weak var favButt: UIButton!
    
    @IBOutlet weak var backButt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

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
