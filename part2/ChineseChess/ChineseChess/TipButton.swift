//
//  TipButton.swift
//  ChineseChess
//
//  Created by boyaa on 2022/8/25.
//

import UIKit

class TipButton: UIButton {

    init(center: CGPoint) {
        super.init(frame: CGRect(x:center.x - 10 , y: center.y - 10, width: 20, height: 20))
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
