//
//  ItemCatViewController.swift
//  Thunder_Store
//
//  Created by loay on 17/01/2023.
//

import UIKit

class ItemCatViewController: UIViewController {
    
    var passLblData : String = ""
    var passId : Int = 0
    var passCat : String = ""
    var products=[Product3(id: 0, title: "", price: 0)]
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var backButt: UIButton!
    
    @IBAction func backButton(_ sender: Any) {
    
        self.dismiss(animated: true, completion: nil)
    }
    var productCatdataAPI = productCatdata()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        getCat = passCat
        
        titleLbl.text = passCat
        backButt.setTitle("", for: .normal)
        collectionView.dataSource = self
        collectionView.delegate = self
       collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        productCatdataAPI.delegate=self
          productCatdataAPI.fetchProduct()
    }
}

extension ItemCatViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCatCollectionViewCell", for: indexPath) as! ItemCatCollectionViewCell
        cell.setup(with: products[indexPath.row])
        cell.setText()
        return cell
    }
    
}

extension ItemCatViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width : 182, height : 282)
    }
   
}

extension ItemCatViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(products[indexPath.row].title)
    }
}

extension ItemCatViewController : productCatdataDelegate {
    func didFetchProduct(catproduct: Catproduct) {
       // print(item.images?[0])
        
        //titleLbl.text = item.images[]
        products = catproduct.products
    
        }
    
    func didFailWithError(error: Error?) {
        print(error!)
    }
    
    
}


