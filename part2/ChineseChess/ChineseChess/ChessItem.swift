//
//  ChessItem.swift
//  ChineseChess
//
//  Created by boyaa on 2022/8/24.
//

import UIKit

class ChessItem: UIButton {
    var isSelecte: Bool = false
    var isRed: Bool?
    
    init(center: CGPoint) {
        let screenSize = UIScreen.main.bounds.size
        let itemSize = CGSize(width:(screenSize.width - 40) / 9 - 4, height:(screenSize.width - 40) / 9 - 4)
        super.init(frame: CGRect(origin: CGPoint(x: center.x - itemSize.width / 2, y: center.y - itemSize.height / 2), size: itemSize))
        setUI()
    }
    
    func setUI(){
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2
        self.layer.cornerRadius = ((UIScreen.main.bounds.width - 40) / 9 - 4) / 2
        
    }
    
    func setTitle(title: String,isOwn: Bool) {
        self.setTitle(title, for: .normal)
        if isOwn {
            self.layer.borderColor = UIColor.red.cgColor
            self.setTitleColor(UIColor.red, for: .normal)
            self.isRed = true
        }else{
            self.layer.borderColor = UIColor.blue.cgColor
            self.setTitleColor(UIColor.blue, for: .normal)
            self.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.isRed = false
        }
    }
    
    func setSelectedState(){
        if !isSelecte {
            self.isSelecte = true
            self.backgroundColor = UIColor.purple
        }
    }
    
    func setUnSelectedState(){
        if isSelecte {
            self.isSelecte = false
            self.backgroundColor = UIColor.white
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 

}
