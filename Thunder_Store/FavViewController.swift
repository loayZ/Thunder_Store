//
//  FavViewController.swift
//  Thunder_Store
//
//  Created by loay on 01/02/2023.
//

import UIKit

class FavViewController: UIViewController {

    @IBOutlet weak var backButt: UIButton!
    
    @IBAction func BackButton(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
    @IBOutlet weak var collectionView: UICollectionView!
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

extension FavViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return favs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavCollectionViewCell", for: indexPath) as! FavCollectionViewCell
           cell.setup(with: favs[indexPath.row])
        cell.setText()
            return cell
    }
    
}

extension FavViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = (UIScreen.main.bounds.width )
        return CGSize(width: availableWidth, height: 100)
    }
   
}

extension FavViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print(notifications[indexPath.row].title)
    }
}

