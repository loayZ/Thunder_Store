//
//  ItemCatViewController.swift
//  Thunder_Store
//
//  Created by loay on 17/01/2023.
//

import UIKit

class ItemCatViewController: UIViewController {
    
    var passLblData : String = ""
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var titleLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = passLblData
        
        collectionView.dataSource = self
        collectionView.delegate = self
       collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}

extension ItemCatViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemcats.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCatCollectionViewCell", for: indexPath) as! ItemCatCollectionViewCell
        cell.setup(with: itemcats[indexPath.row])
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
        print(itemcats[indexPath.row].title)
    }
}