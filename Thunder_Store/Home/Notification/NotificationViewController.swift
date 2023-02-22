//
//  NotificationViewController.swift
//  Thunder_Store
//
//  Created by loay on 26/01/2023.
//

import UIKit

class NotificationViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var backButt: UIButton!
    
    @IBAction func backButton(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
     
       backButt.setTitle("", for: .normal)
        collectionView.dataSource = self
        collectionView.delegate = self
       collectionView.collectionViewLayout = UICollectionViewFlowLayout()
       
//        productCatdataAPI.delegate=self
//          productCatdataAPI.fetchProduct()
//        productCatdataAPI.fetchNewItems()
         
    }
}

extension NotificationViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return notifications.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NotificationCollectionViewCell", for: indexPath) as! NotificationCollectionViewCell
           cell.setup(with: notifications[indexPath.row])
            return cell
    }
    
}

extension NotificationViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = (UIScreen.main.bounds.width )
        return CGSize(width: availableWidth, height: 100)
    }
   
}

extension NotificationViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print(notifications[indexPath.row].title)
    }
}

