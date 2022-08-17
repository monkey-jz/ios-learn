//
//  CollectionViewDemo1ViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/11.
//

import UIKit

class CollectionViewDemo1ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 100
        layout.minimumInteritemSpacing = 50
        layout.headerReferenceSize = CGSize(width: self.view.frame.size.width ,height: 30)
        layout.footerReferenceSize = CGSize(width: self.view.frame.size.width, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 10)
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collectionView?.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.view.addSubview(self.collectionView!)
     
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        cell.backgroundColor = UIColor.brown
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row % 2 == 0 {
            return CGSize(width: 30, height: 60)
        }else if indexPath.row % 3 == 0 {
            return CGSize(width: 50, height: 80)
        }else{
            return CGSize(width: 80, height: 60)
        }
    }
    

}
