//
//  HomeView.swift
//  NoteBook
//
//  Created by boyaa on 2022/8/22.
//

import UIKit

class HomeView: UIScrollView {
   
    let interItemSpacing = 15
    let lineSpacing = 25
    var dataArray: Array<String>?
    var btnItemArray: Array<UIButton> = Array()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateLayout() {
        let itemWidth = (self.frame.size.width - CGFloat(interItemSpacing) * 4) / 3
        let itemHeight = itemWidth * 4 / 3
        for btnItem in btnItemArray {
            btnItem.removeFromSuperview()
        }
        btnItemArray.removeAll()
        if dataArray != nil && dataArray!.count > 0 {
            for index in  0..<dataArray!.count {
                let btn = UIButton()
                btn.frame = CGRect(x: CGFloat(interItemSpacing) + CGFloat(index % 3) * (itemWidth + CGFloat(interItemSpacing)), y: CGFloat(lineSpacing) + CGFloat(index / 3) * (itemHeight + CGFloat(lineSpacing)), width: itemWidth, height: itemHeight)
                btn.backgroundColor = UIColor(red: 1, green: 242 / 255, blue: 216 / 255 , alpha: 1)
                btn.layer.masksToBounds = true
                btn.layer.cornerRadius = 15
                btn.setTitleColor(UIColor.purple, for: .normal)
                btn.setTitle(dataArray![index], for: .normal)
                btn.tag = index
                btn.addTarget(self, action: #selector(onItemClick(item:)), for: .touchUpInside)
                self.addSubview(btn)
                self.btnItemArray.append(btn)
                
            }
            self.contentSize = CGSize(width: self.frame.size.width ,height: btnItemArray.last!.frame.origin.y + itemHeight +  CGFloat(lineSpacing))
        }
        
        
    }
    
    @objc
    func onItemClick(item: UIButton) {
        print(item.currentTitle)
    }

}
