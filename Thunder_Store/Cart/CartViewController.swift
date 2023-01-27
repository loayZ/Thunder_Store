//
//  CartViewController.swift
//  Thunder_Store
//
//  Created by loay on 19/01/2023.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var FavButt: UIButton!
    
    @IBOutlet weak var ItemNum: UILabel!
    
    @IBAction func FavButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Fav") 
        vc.modalPresentationStyle = .currentContext
        present(vc, animated : true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FavButt.setTitle("", for: .normal)
        
        collectionView.dataSource = self
        collectionView.delegate = self
       collectionView.collectionViewLayout = UICollectionViewFlowLayout()
       
    }

}

extension CartViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let numItemString = String(carts.count)
        
        if carts.count > 0{
            if carts.count == 1 {
                ItemNum.text = "\(numItemString) Item in your cart"
            }
            else{
                ItemNum.text = "\(numItemString) Items in your cart"
            }
        }
        
        return carts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCollectionViewCell", for: indexPath) as! CartCollectionViewCell
        cell.setup(with: carts[indexPath.row])
        cell.setText()
        return cell
    }
    
}

extension CartViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width : 350, height : 100)
    }
   
}

extension CartViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(carts[indexPath.row].title)
    }
}
