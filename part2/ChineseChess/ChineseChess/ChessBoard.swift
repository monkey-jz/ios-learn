//
//  ChessBoard.swift
//  ChineseChess
//
//  Created by boyaa on 2022/8/24.
//

import UIKit
import CoreGraphics

enum ROLE {
    case BLUE
    case RED
}

protocol ChessBoardProtocol {
    func onChessItemClick(chessItem: ChessItem)
    func onChessMoveEnd()
    func gameOver(winer: ROLE)
}

class ChessBoard: UIView {
    
    let width = (UIScreen.main.bounds.width - 40) / 9
    
    //红方所有棋子
    let allRedChessItemsName = ["車","馬","相","士","帥","士","相","馬","車","炮","炮","兵","兵","兵","兵","兵"]
    //绿方所有棋子
    let allBlueChessItemsName = ["车","马","象","仕","将","仕","象","马","车","炮","炮","卒","卒","卒","卒","卒"]
    
    var currentRedChessItemArray = Array<ChessItem>()
    
    var currentBlueChessItemArray = Array<ChessItem>()
    
    var delegate: ChessBoardProtocol?
    
    //当前棋子所有可以走的位置的标记实例数组
    var tipButtonArray = Array<TipButton>()
    
    //当前棋子所有可以行走的矩阵位置
    var currentChessCanMovePositions = Array<(Int,Int)>()
    
    init(origin: CGPoint) {
        
        super.init(frame: CGRect(x: origin.x, y: origin.y, width: UIScreen.main.bounds.width - 40, height: width * 10))
        self.backgroundColor = UIColor.orange
        let label1 = UILabel(frame: CGRect(x: 20 + width  , y: width * 9 / 2  , width: width * 2, height: width))
        label1.textColor = UIColor.red
        label1.textAlignment = .center
        label1.text = "楚河"
        self.addSubview(label1)
        let label2 = UILabel(frame: CGRect(x: self.bounds.width - 20 - width * 3, y: width * 9 / 2  , width: width * 2, height: width))
        label2.textColor = UIColor.blue
        label2.textAlignment = .center
        label2.text = "漢界"
        label2.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        self.addSubview(label2)
    }
    
    override func draw(_ rect: CGRect) {
       
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.setLineWidth(0.5)
        //10行9列
        //绘制行
        for index in 0...9 {
            context?.move(to: CGPoint(x: width / 2, y: (width / 2 + width * CGFloat(index))))
            context?.addLine(to: CGPoint(x: rect.size.width - width / 2, y: (width / 2 + width * CGFloat(index))))
            context?.drawPath(using: CGPathDrawingMode.stroke)
        }
        //绘制列
        for index in 0..<9 {
            if index == 0 || index == 8 {
                context?.move(to: CGPoint(x: (width / 2 + width * CGFloat(index)), y: width / 2 ))
                context?.addLine(to: CGPoint(x: (width / 2 + width * CGFloat(index)), y: rect.size.height - width / 2))
                context?.drawPath(using: CGPathDrawingMode.stroke)
            }else{
                context?.move(to: CGPoint(x: (width / 2 + width * CGFloat(index)), y: width / 2))
                context?.addLine(to: CGPoint(x: (width / 2 + width * CGFloat(index)), y: width / 2 + width * 4))
                context?.move(to: CGPoint(x: (width / 2 + width * CGFloat(index)), y: width / 2 + width * 5))
                context?.addLine(to: CGPoint(x: (width / 2 + width * CGFloat(index)), y: rect.size.height - width / 2))
                context?.drawPath(using: CGPathDrawingMode.stroke)
            }
           
        }
        
        //绘制将帅区
        //己方
        context?.move(to: CGPoint(x: 20 + width * 3, y: self.bounds.height - width / 2))
        context?.addLine(to: CGPoint(x: 20 + width * 5, y: self.bounds.height - width / 2 - width * 2))
        context?.move(to: CGPoint(x: 20 + width * 3, y: self.bounds.height - width / 2 - width * 2))
        context?.addLine(to: CGPoint(x: self.bounds.width - 20 - width * 3, y: self.bounds.height - width / 2))
        //对方
        context?.move(to: CGPoint(x: 20 + width * 3, y: width / 2))
        context?.addLine(to: CGPoint(x: self.bounds.width - 20 - width * 3, y: width / 2 + width * 2))
        context?.move(to: CGPoint(x: self.bounds.width - 20 - width * 3, y: width / 2))
        context?.addLine(to: CGPoint(x: 20 + width * 3, y: width / 2 + width * 2))
        
        context?.drawPath(using: CGPathDrawingMode.stroke)
        
        //绘制棋子
        restartGame()
    
    }
    
    func restartGame() {
        cancelAllSelect()
        
        for item in currentRedChessItemArray {
            item.removeFromSuperview()
        }
        for item in currentBlueChessItemArray {
            item.removeFromSuperview()
        }
        currentRedChessItemArray.removeAll()
        currentBlueChessItemArray.removeAll()
        
        for index in 0..<16 {
            var redChessItem: ChessItem?
            var blueChessItem: ChessItem?
            if index < 9 {
                //布局在同一行的八个棋子
                //己方
                redChessItem = ChessItem(center: CGPoint(x: width / 2 + width * CGFloat(index), y: self.bounds.height - width / 2))
                redChessItem?.setTitle(title: allRedChessItemsName[index], isOwn: true)
                //敌方
                blueChessItem = ChessItem(center: CGPoint(x: width / 2 + width * CGFloat(index), y: width / 2))
                blueChessItem?.setTitle(title: allBlueChessItemsName[index], isOwn: false)
            }else if index < 11 {
                //布局炮
               if index == 9 {
                    //己方
                    redChessItem = ChessItem(center: CGPoint(x: width / 2 + width, y: self.bounds.height - width / 2 - width * 2))
                    redChessItem?.setTitle(title: allRedChessItemsName[index], isOwn: true)
                    //敌方
                    blueChessItem = ChessItem(center: CGPoint(x: width / 2 + width, y: width / 2 + width * 2))
                    blueChessItem?.setTitle(title: allBlueChessItemsName[index], isOwn: false)
                }else {
                    //己方
                    redChessItem = ChessItem(center: CGPoint(x: self.bounds.width - width / 2 - width, y: self.bounds.height - width / 2 - width * 2))
                    redChessItem?.setTitle(title: allRedChessItemsName[index], isOwn: true)
                    //敌方
                    blueChessItem = ChessItem(center: CGPoint(x: self.bounds.width - width / 2 - width, y: width / 2 + width * 2))
                    blueChessItem?.setTitle(title: allBlueChessItemsName[index], isOwn: false)
                }
                
            }else {
                //布局兵和卒
                //己方
                redChessItem = ChessItem(center: CGPoint(x: width / 2 + width * 2 * CGFloat(index - 11), y: self.bounds.height - width / 2 - width * 3))
                redChessItem?.setTitle(title: allRedChessItemsName[index], isOwn: true)
                //敌方
                blueChessItem = ChessItem(center: CGPoint(x: width / 2 + width * 2 * CGFloat(index - 11), y: width / 2 + width * 3))
                blueChessItem?.setTitle(title: allBlueChessItemsName[index], isOwn: false)
                
            }
            self.addSubview(redChessItem!)
            self.addSubview(blueChessItem!)
            currentRedChessItemArray.append(redChessItem!)
            currentBlueChessItemArray.append(blueChessItem!)
            redChessItem?.addTarget(self, action: #selector(onChessItemClick(chessItem:)), for: UIControl.Event.touchUpInside)
            blueChessItem?.addTarget(self, action: #selector(onChessItemClick(chessItem:)), for: UIControl.Event.touchUpInside)
        }
        
        
    }
    
    @objc func onChessItemClick(chessItem: ChessItem) {
        if delegate != nil {
            delegate?.onChessItemClick(chessItem: chessItem)
        }
      
    }
    
    func cancelAllSelect() {
        currentRedChessItemArray.forEach{(chessItem) in
            chessItem.setUnSelectedState()
        }
        currentBlueChessItemArray.forEach{(chessItem) in
            chessItem.setUnSelectedState()
        }
    }
    
    func positionTransToMatrix(chessItem: ChessItem) -> (Int,Int) {
        return (Int(chessItem.center.x - width / 2) / Int(width),Int(chessItem.center.y - width / 2) / Int(width))
    }
    
    func getAllRedChessMatrixList() -> [(Int,Int)] {
        var array = Array<(Int,Int)>()
        currentRedChessItemArray.forEach{(item) in
            array.append(positionTransToMatrix(chessItem: item))
        }
        return array
    }
    
    func getAllBlueChessMatrixList() -> [(Int,Int)] {
        var array = Array<(Int,Int)>()
        currentBlueChessItemArray.forEach{(item) in
            array.append(positionTransToMatrix(chessItem: item))
        }
        return array
    }
    
    func showChessItemCanMovePosition(canMovePositions:[(Int,Int)],chessItem: ChessItem) {
        var list: Array<(Int,Int)>?
        if chessItem.isRed! {
            list = getAllRedChessMatrixList()
        }else {
            list = getAllBlueChessMatrixList()
        }
        currentChessCanMovePositions.removeAll()
        canMovePositions.forEach{(canMovePosition) in
            let contains = list!.contains(where: {(chessItemPosition) -> Bool in
                if canMovePosition == chessItemPosition {
                    return true
                }else{
                    return false
                }
            })
            if !contains {
                currentChessCanMovePositions.append(canMovePosition)
            }
       }
        tipButtonArray.forEach{(tipButton) in
            tipButton.removeFromSuperview()
        }
        tipButtonArray.removeAll()
        for index in 0..<currentChessCanMovePositions.count {
            let position = currentChessCanMovePositions[index]
            let center = CGPoint(x: width / 2 + width * CGFloat(position.0)  , y: CGFloat(width / 2 + width * CGFloat(position.1)))
            let tipButton = TipButton(center:center)
            tipButton.addTarget(self, action: #selector(moveChessItem(tipButton:)), for: UIControl.Event.touchUpInside)
            tipButton.tag = index + 100
            self.addSubview(tipButton)
            tipButtonArray.append(tipButton)
        }
    }
    
    @objc func moveChessItem(tipButton: TipButton) {
        let toPosition = currentChessCanMovePositions[tipButton.tag - 100]
        let toPoint = CGPoint(x: width / 2 + width * CGFloat(toPosition.0), y: CGFloat(width / 2 + width * CGFloat(toPosition.1)))
        var isRed: Bool?
        for item in currentRedChessItemArray {
            if item.isSelecte {
                isRed = true
                UIView.animate(withDuration: 0.3, animations: {
                    item.center = toPoint
                })
            }
        }
        for item in currentBlueChessItemArray {
            if item.isSelecte {
                isRed = false
                UIView.animate(withDuration: 0.3, animations: {
                    item.center = toPoint
                })
            }
        }
        var shouldDeleteItem: ChessItem?
        if isRed! {
            currentBlueChessItemArray.forEach{(item) in
                if positionTransToMatrix(chessItem: item) == toPosition {
                    shouldDeleteItem = item
                }
            }
        }else {
            currentRedChessItemArray.forEach{(item) in
                if positionTransToMatrix(chessItem: item) == toPosition {
                    shouldDeleteItem = item
                }
            }
        }
        if let item = shouldDeleteItem {
            item.removeFromSuperview()
            if isRed! {
                currentBlueChessItemArray.remove(at: currentBlueChessItemArray.firstIndex(of: item)!)
            }else {
                currentRedChessItemArray.remove(at: currentRedChessItemArray.firstIndex(of: item)!)
            }
            if item.title(for: .normal) == "将" {
                if delegate != nil {
                    delegate?.gameOver(winer: .RED)
                }
            }
            if item.title(for: .normal) == "帥" {
                if delegate != nil {
                    delegate?.gameOver(winer: .BLUE)
                }
            }
        }
        tipButtonArray.forEach{(tipButton) in
            tipButton.removeFromSuperview()
        }
        tipButtonArray.removeAll()
        if delegate != nil {
            delegate?.onChessMoveEnd()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    

}
