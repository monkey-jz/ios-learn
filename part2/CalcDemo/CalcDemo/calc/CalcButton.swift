//
//  CalcButton.swift
//  CalcDemo
//
//  Created by boyaa on 2022/8/19.
//

import UIKit

class CalcButton: UIButton {
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 219 / 255.0, green: 219 / 255.0, blue: 219 / 255.0, alpha: 1).cgColor
        self.setTitleColor(.orange, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 25)
        self.setTitleColor(.cyan, for: .highlighted)
    
    }
}
