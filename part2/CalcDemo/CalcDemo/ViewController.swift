//
//  ViewController.swift
//  CalcDemo
//
//  Created by boyaa on 2022/8/19.
//

import UIKit

class ViewController: UIViewController,CalcBtnClickDelegate {
    var screenView: ScreenView!
    var calcBoardView: CalcBoardView!
    var calculator: Calculator!
    //这个输入是否需要刷新显示屏
    var isNew = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calcBoardView = CalcBoardView()
        screenView = ScreenView()
        calcBoardView.delegate = self
        self.view.addSubview(screenView)
        self.view.addSubview(calcBoardView)
        calcBoardView.snp.makeConstraints({(maker) in
            maker.bottom.right.left.equalTo(0)
            maker.height.equalTo(self.view).multipliedBy(4 / 8.0)
        })
        screenView.snp.makeConstraints({(maker) in
            maker.right.left.equalTo(0)
            maker.bottom.equalTo(calcBoardView.snp.top)
            maker.height.equalTo(calcBoardView.snp.height).multipliedBy(2 / 8.0)
        })
        calculator = Calculator()
       
    }
    
    func onCalcBtnClick(content: String) {
        if content == "AC" || content == "Delete" || content == "=" {
            switch content {
            case "AC":
                screenView.clearContent()
                screenView.refreshHistory()
            case "Delete":
                screenView.deleteInput()
            case "=":
                let result = calculator.calc(equation: screenView.inputString)
                screenView.refreshHistory()
                screenView.clearContent()
                screenView.displayResult(result: String(result))
                isNew = true
            default:
                screenView.refreshHistory()
            }
        }else {
            if isNew {
                screenView.clearContent()
                isNew = false
            }
            screenView.inputContent(content: content)
        }
        
    }
   
}

