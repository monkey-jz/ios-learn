//
//  Screen.swift
//  CalcDemo
//
//  Created by boyaa on 2022/8/19.
//

import UIKit

class ScreenView: UIView {
    
    var inputLabel: UILabel!
    var displayLabel: UILabel!
    //用户输入表达式或者计算结果字符串
    var inputString = ""
    //历史表达式字符串
    var historyString = ""
    //所有数字字符 用于进行检测匹配
    let figureArray:Array<Character> = ["0","1","2","3","4","5","6","7", "8","9","."]
    //所有运算功能字符 用于进行检测匹配
    let funcArray = ["+","-","*","/","%","^"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        installUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installUI() {
        inputLabel = UILabel()
        displayLabel = UILabel()
        self.addSubview(inputLabel)
        self.addSubview(displayLabel)
       
        inputLabel.textAlignment = .right
        inputLabel.font = .systemFont(ofSize: 32)
        inputLabel.textColor = .gray
        inputLabel.adjustsFontSizeToFitWidth = true
        inputLabel.minimumScaleFactor = 0.5
        inputLabel.lineBreakMode = .byTruncatingHead
        inputLabel.numberOfLines = 0
        
        displayLabel.textAlignment = .right
        displayLabel.font = .systemFont(ofSize: 28)
        displayLabel.textColor = .purple
        displayLabel.adjustsFontSizeToFitWidth = true
        displayLabel.minimumScaleFactor = 0.5
        displayLabel.lineBreakMode = .byTruncatingHead
        displayLabel.numberOfLines = 0
        
        inputLabel.snp.makeConstraints({(maker) in
            maker.bottom.right.equalTo(0)
            maker.left.equalTo(10)
            maker.height.equalTo(inputLabel.superview!.snp.height).multipliedBy(0.5).offset(-10)
            
        })
        displayLabel.snp.makeConstraints({(maker) in
            maker.right.left.equalTo(0)
            maker.bottom.equalTo(inputLabel.snp.top)
            maker.height.equalTo(inputLabel.superview!.snp.height).multipliedBy(0.5).offset(-10)
            
        })
        
    }
    
    func clearContent() {
        inputString = ""
    }
    func refreshHistory() {
        historyString = inputString
        displayLabel.text = historyString
        inputLabel.text = inputString
    }
  
    func deleteInput() {
       
        if inputString.count > 0 {
            inputString.remove(at: inputString.index(before: inputString.endIndex))
            inputLabel.text = inputString
        }
    }
    
    func displayResult(result: String) {
        displayLabel.text = result
        historyString = result
    }
    
    func inputContent(content: String) {
        if !figureArray.contains(content.last!) && !funcArray.contains(content) {
            return
        }
        if inputString.count > 0 {
          
            if figureArray.contains(inputString.last!) {
                inputString.append(content)
                inputLabel.text = inputString
            }else{
                if figureArray.contains(content.last!) {
                    inputString.append(content)
                    inputLabel.text = inputString
                }
            }
        }else{
            if figureArray.contains(content.last!){
                inputString.append(content)
                inputLabel.text = inputString
            }
        }
        
    }
    
}
