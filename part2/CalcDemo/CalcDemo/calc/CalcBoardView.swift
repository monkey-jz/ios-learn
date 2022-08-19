//
//  CalcView.swift
//  CalcDemo
//
//  Created by boyaa on 2022/8/19.
//

import UIKit

protocol CalcBtnClickDelegate {
    func onCalcBtnClick(content: String)
}

class CalcBoardView: UIView {
    var delegate: CalcBtnClickDelegate?
    
    var dataArray = ["0",".","%","="
                    ,"1","2","3","+"
                    ,"4","5","6","-"
                    ,"7","8","9","*"
                    ,"AC","Delete","^","/"
                    ]
    
    override init(frame: CGRect) {
       super.init(frame:frame)
        installUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func installUI(){
        
        var frontCalcButton: CalcButton!
        for index in 0..<self.dataArray.count{
            let btn = CalcButton()
            self.addSubview(btn)
            btn.snp.makeConstraints({(maker) in
                if index % 4 == 0 {
                    maker.left.equalTo(0)
                }else {
                    maker.left.equalTo(frontCalcButton.snp.right)
                }
                if index / 4 == 0 {
                    maker.bottom.equalTo(0)
                }else if index % 4 == 0 {
                    
                    maker.bottom.equalTo(frontCalcButton.snp.top)
                }else {
                    maker.bottom.equalTo(frontCalcButton.snp.bottom)
                }
                maker.width.equalTo(btn.superview!.snp.width).multipliedBy(0.25)
                maker.height.equalTo(btn.superview!.snp.height).multipliedBy(0.2)
                btn.tag = index + 10
                btn.addTarget(self, action: #selector(onBtnClick(btn:)), for: .touchUpInside)
                btn.setTitle(dataArray[index], for: .normal)
                frontCalcButton = btn
             
            })
            
        }
        
        
    }
    @objc func onBtnClick(btn: UIButton){
        if delegate != nil {
            delegate?.onCalcBtnClick(content: btn.currentTitle!)
        }
    }
 

}
