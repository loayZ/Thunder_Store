//
//  ProfileViewController.swift
//  test
//
//  Created by loay on 11/01/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
       /* let nibCell = UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        */
        collectionView.dataSource = self
        collectionView.delegate = self
       collectionView.collectionViewLayout = UICollectionViewFlowLayout()
       
    }

}

extension ProfileViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileLinkItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as! ProfileCollectionViewCell
        cell.setup(with: profileLinkItems[indexPath.row])
        return cell
    }
    
}

extension ProfileViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width : 320, height : 30)
    }
   
}

extension ProfileViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(profileLinkItems[indexPath.row].title)
    }
}


