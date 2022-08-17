//
//  WaterFallLayout.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/11.
//

import UIKit

class WaterFallLayout: UICollectionViewFlowLayout{
    
    var itemCount: Int
    var attributeArray: Array<UICollectionViewLayoutAttributes>?
    
    required init?(coder: NSCoder) {
        self.itemCount = 0
        super.init(coder: coder)
    }
    
    init(itemCount: Int) {
        self.itemCount = itemCount
        super.init()
    }
    
    override func prepare() {
        super.prepare()
        self.scrollDirection = .vertical
        attributeArray = Array<UICollectionViewLayoutAttributes>()
        let WIDTH = (UIScreen.main.bounds.width - self.minimumInteritemSpacing) / 2
        var queueHeight:(one: Int,two: Int) = (0,0)
        for index in 0...self.itemCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attri = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            let height = Int(arc4random() % 150)
            print(height)
            var queue = 0
            if queueHeight.one <= queueHeight.two {
                queueHeight.one += (height + Int(self.minimumLineSpacing))
                queue = 0
            }else{
                queueHeight.two += (height + Int(self.minimumLineSpacing))
                queue = 1
            }
            let tempHeight = queue == 0 ? queueHeight.one - height: queueHeight.two - height
            attri.frame = CGRect(x: (WIDTH + self.minimumInteritemSpacing) * CGFloat(queue), y: CGFloat(tempHeight), width: WIDTH, height:CGFloat(height))
            attributeArray?.append(attri)
 
        }
        if queueHeight.one <= queueHeight.two  {
            self.itemSize = CGSize(width: WIDTH, height: CGFloat(queueHeight.two * 2 / self.itemCount) - minimumLineSpacing)
        }else{
            self.itemSize = CGSize(width: WIDTH, height: CGFloat(queueHeight.one * 2 / self.itemCount) - minimumLineSpacing)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attributeArray
    }
    

}
