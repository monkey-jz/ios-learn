//
//  GameEngine.swift
//  ChineseChess
//
//  Created by boyaa on 2022/8/25.
//

import UIKit

class GameEngine: NSObject,ChessBoardProtocol {
    
    var chessBoard: ChessBoard?
    var isRedFirstMove = true
    var isRedMove = true
    
    init(chessBoard: ChessBoard?) {
        self.chessBoard = chessBoard
        super.init()
        
    }
   
    func restartGame(){
        chessBoard!.restartGame()
    }
    
    func setRedFirstMove(redFirstMove: Bool) {
        isRedFirstMove = redFirstMove
        isRedMove = redFirstMove
    }
    
    func onChessItemClick(chessItem: ChessItem) {
        if isRedMove {
            if chessItem.isRed! {
                chessBoard?.cancelAllSelect()
                chessItem.setSelectedState()
            }else {
                return
            }
        }else {
            if !chessItem.isRed! {
                chessBoard?.cancelAllSelect()
                chessItem.setSelectedState()
            }else {
                return
            }
        }
        checkCanMove(chessItem: chessItem)
    }
    func checkCanMove(chessItem: ChessItem) {
        let chessName = chessItem.title(for: UIControl.State.normal)
        let point = chessBoard?.positionTransToMatrix(chessItem: chessItem)
        var canMovePositions = Array<(Int,Int)>()
        if chessName == "兵" {
            if point!.1 > 4 {
                canMovePositions.append((point!.0,point!.1 - 1))
            }else {
                if point!.0 > 0 {
                    canMovePositions.append((point!.0 - 1,point!.1))
                }
                if point!.0 < 8{
                    canMovePositions.append((point!.0 + 1,point!.1))
                }
                if point!.1 > 0 {
                    canMovePositions.append((point!.0,point!.1 - 1))
                }
            }
        }
        if chessName == "卒" {
            if point!.1 < 5 {
                canMovePositions.append((point!.0,point!.1 + 1))
            }else {
                if point!.0 > 0 {
                    canMovePositions.append((point!.0 - 1,point!.1))
                }
                if point!.0 < 8 {
                    canMovePositions.append((point!.0 + 1,point!.1))
                }
                if point!.1 < 9 {
                    canMovePositions.append((point!.0,point!.1 + 1))
                }
            }
        }
        if chessName == "士" {
            if point!.1 == 9 {
                if point!.0 == 3 {
                    canMovePositions.append((point!.0 + 1,point!.1 - 1))
                }else{
                    canMovePositions.append((point!.0 - 1,point!.1 - 1))
                }
            }
            if point!.1 == 8 {
                canMovePositions.append((point!.0 - 1,point!.1 - 1))
                canMovePositions.append((point!.0 + 1,point!.1 - 1))
                canMovePositions.append((point!.0 - 1,point!.1 + 1))
                canMovePositions.append((point!.0 + 1,point!.1 + 1))
            }
            if point!.1 == 7 {
                if point!.0 == 3 {
                    canMovePositions.append((point!.0 + 1,point!.1 + 1))
                }else{
                    canMovePositions.append((point!.0 - 1,point!.1 + 1))
                }
                
            }
        }
        if chessName == "仕" {
            if point!.1 == 0 {
                if point!.0 == 3 {
                    canMovePositions.append((point!.0 + 1,point!.1 + 1))
                }else{
                    canMovePositions.append((point!.0 - 1,point!.1 + 1))
                }
            }
            if point!.1 == 1 {
                canMovePositions.append((point!.0 - 1,point!.1 - 1))
                canMovePositions.append((point!.0 + 1,point!.1 - 1))
                canMovePositions.append((point!.0 - 1,point!.1 + 1))
                canMovePositions.append((point!.0 + 1,point!.1 + 1))
            }
            if point!.1 == 2 {
                if point!.0 == 3 {
                    canMovePositions.append((point!.0 + 1,point!.1 - 1))
                }else{
                    canMovePositions.append((point!.0 - 1,point!.1 - 1))
                }
            }
        }
        if chessName == "将" {
            if point!.1 < 2 {
                canMovePositions.append((point!.0,point!.1 + 1))
            }
            if point!.1 > 0 {
                canMovePositions.append((point!.0,point!.1 - 1))
            }
            if point!.0 < 5 {
                canMovePositions.append((point!.0 + 1,point!.1))
            }
            if point!.0 > 3 {
                canMovePositions.append((point!.0 - 1,point!.1))
            }
        }
        if chessName == "帥" {
            if point!.1 < 9 {
                canMovePositions.append((point!.0,point!.1 + 1))
            }
            if point!.1 > 7 {
                canMovePositions.append((point!.0,point!.1 - 1))
            }
            if point!.0 < 5 {
                canMovePositions.append((point!.0 + 1,point!.1))
            }
            if point!.0 > 3 {
                canMovePositions.append((point!.0 - 1,point!.1))
            }
        }
        if chessName == "相" {
            let list = chessBoard?.getAllRedChessMatrixList()
            //左上
            if point!.0 - 2 >= 0 && point!.1 - 2 > 4 {
                if !list!.contains(where: {(position) -> Bool in
                    return position == (point!.0 - 1,point!.1 - 1)
                }) {
                    canMovePositions.append((point!.0 - 2,point!.1 - 2))
                }
            }
            //右上
            if point!.0 + 2 <= 8 && point!.1 - 2 > 4{
                if !list!.contains(where: {(position) -> Bool in
                    return position == (point!.0 + 1,point!.1 - 1)
                }) {
                    canMovePositions.append((point!.0 + 2,point!.1 - 2))
                }
            }
            //左下
            if point!.0 - 2 >= 0 && point!.1 + 2 <= 9{
                if !list!.contains(where: {(position) -> Bool in
                    return position == (point!.0 - 1,point!.1 + 1)
                }) {
                    canMovePositions.append((point!.0 - 2,point!.1 + 2))
                }
            }
            //右下
            if point!.0 + 2 <= 8 && point!.1 + 2 <= 9{
                if !list!.contains(where: {(position) -> Bool in
                    return position == (point!.0 + 1,point!.1 + 1)
                }) {
                    canMovePositions.append((point!.0 + 2,point!.1 + 2))
                }
            }
            
        }
        if chessName == "象" {
            let list = chessBoard?.getAllBlueChessMatrixList()
            //左下
            if point!.0 - 2 >= 0 && point!.1 + 2 <= 4 {
                if !list!.contains(where: {(position) -> Bool in
                    return position == (point!.0 - 1,point!.1 + 1)
                }) {
                    canMovePositions.append((point!.0 - 2,point!.1 + 2))
                }
            }
            //右下
            if point!.0 + 2 <= 8 && point!.1 + 2 <= 4 {
                if !list!.contains(where: {(position) -> Bool in
                    return position == (point!.0 + 1,point!.1 + 1)
                }) {
                    canMovePositions.append((point!.0 + 2,point!.1 + 2))
                }
            }
            //左上
            if point!.0 - 2 >= 0 && point!.1 - 2 >= 0{
                if !list!.contains(where: {(position) -> Bool in
                    return position == (point!.0 - 1,point!.1 - 1)
                }) {
                    canMovePositions.append((point!.0 - 2,point!.1 - 2))
                }
            }
            //右上
            if point!.0 + 2 <= 8 && point!.1 - 2 >= 0{
                if !list!.contains(where: {(position) -> Bool in
                    return position == (point!.0 + 1,point!.1 - 1)
                }) {
                    canMovePositions.append((point!.0 + 2,point!.1 - 2))
                }
            }
            
        }
        if chessName == "馬" {
            let redList = chessBoard?.getAllRedChessMatrixList()
            let blueList = chessBoard?.getAllBlueChessMatrixList()
            //竖日
            //左上
            if point!.0 - 1 >= 0 && point!.1 - 2 >= 0 {
                if !redList!.contains(where: {(position) -> Bool in
                    return position == (point!.0,point!.1 - 1)
                }) && !blueList!.contains(where: {(position) in
                    return position == (point!.0,point!.1 - 1)
                }) {
                    canMovePositions.append((point!.0 - 1,point!.1 - 2))
                }
            }
            //右上
            if point!.0 + 1 <= 8 && point!.1 - 2 >= 0 {
                if !redList!.contains(where: {(position) -> Bool in
                    return position == (point!.0,point!.1 - 1)
                }) && !blueList!.contains(where: {(position) in
                    return position == (point!.0,point!.1 - 1)
                }) {
                    canMovePositions.append((point!.0 + 1,point!.1 - 2))
                }
            }
            //左下
            if point!.0 - 1 >= 0 && point!.1 + 2 <= 9{
                if !redList!.contains(where: {(position) -> Bool in
                    return position == (point!.0,point!.1 + 1)
                }) && !blueList!.contains(where: {(position) in
                    return position == (point!.0,point!.1 + 1)
                }) {
                    canMovePositions.append((point!.0 - 1,point!.1 + 2))
                }
            }
            //右下
            if point!.0 + 1 <= 8 && point!.1 + 2 <= 9{
                if !redList!.contains(where: {(position) -> Bool in
                    return position == (point!.0,point!.1 + 1)
                }) && !blueList!.contains(where: {(position) in
                    return position == (point!.0,point!.1 + 1)
                }) {
                    canMovePositions.append((point!.0 + 1,point!.1 + 2))
                }
            }
            //横日
            //左上
            if point!.0 - 2 >= 0 && point!.1 - 2 >= 0 {
                if !redList!.contains(where: {(position) -> Bool in
                    return position == (point!.0 - 1,point!.1)
                }) && !blueList!.contains(where: {(position) in
                    return position == (point!.0 - 1,point!.1)
                }) {
                    canMovePositions.append((point!.0 - 2,point!.1 - 1))
                }
            }
            //右上
            if point!.0 + 2 <= 8 && point!.1 - 2 >= 0{
                if !redList!.contains(where: {(position) -> Bool in
                    return position == (point!.0 + 1,point!.1)
                }) && !blueList!.contains(where: {(position) in
                    return position == (point!.0 + 1,point!.1)
                }) {
                    canMovePositions.append((point!.0 + 2,point!.1 - 1))
                }
            }
            //左下
            if point!.0 - 2 >= 0 && point!.1 + 2 <= 9{
                if !redList!.contains(where: {(position) -> Bool in
                    return position == (point!.0 - 1,point!.1)
                }) && !blueList!.contains(where: {(position) in
                    return position == (point!.0 - 1,point!.1)
                }) {
                    canMovePositions.append((point!.0 - 2,point!.1 + 1))
                }
            }
            //右下
            if point!.0 + 2 <= 8 && point!.1 + 2 <= 9{
                if !redList!.contains(where: {(position) -> Bool in
                    return position == (point!.0 + 1,point!.1)
                }) && !blueList!.contains(where: {(position) in
                    return position == (point!.0 + 1,point!.1)
                }) {
                    canMovePositions.append((point!.0 + 2,point!.1 + 1))
                }
            }
        }
          
        if chessName == "马" {
            let redList = chessBoard?.getAllRedChessMatrixList()
            let blueList = chessBoard?.getAllBlueChessMatrixList()
            //竖日
            //左上
            if point!.0 - 1 >= 0 && point!.1 - 2 >= 0 {
                if !blueList!.contains(where: {(position) -> Bool in
                    return position == (point!.0,point!.1 - 1)
                }) && !redList!.contains(where: {(position) in
                    return position == (point!.0,point!.1 - 1)
                }) {
                    canMovePositions.append((point!.0 - 1,point!.1 - 2))
                }
            }
            //右上
            if point!.0 + 1 <= 8 && point!.1 - 2 >= 0{
                if !blueList!.contains(where: {(position) -> Bool in
                    return position == (point!.0,point!.1 - 1)
                }) && !redList!.contains(where: {(position) in
                    return position == (point!.0,point!.1 - 1)
                }) {
                    canMovePositions.append((point!.0 + 1,point!.1 - 2))
                }
            }
            //左下
            if point!.0 - 1 >= 0 && point!.1 + 2 <= 9{
                if !blueList!.contains(where: {(position) -> Bool in
                    return position == (point!.0,point!.1 + 1)
                }) && !redList!.contains(where: {(position) in
                    return position == (point!.0,point!.1 + 1)
                }) {
                    canMovePositions.append((point!.0 - 1,point!.1 + 2))
                }
            }
            //右下
            if point!.0 + 1 <= 8 && point!.1 + 2 <= 9{
                if !blueList!.contains(where: {(position) -> Bool in
                    return position == (point!.0,point!.1 + 1)
                }) && !redList!.contains(where: {(position) in
                    return position == (point!.0,point!.1 + 1)
                }) {
                    canMovePositions.append((point!.0 + 1,point!.1 + 2))
                }
            }
            //横日
            //左上
            if point!.0 - 2 >= 0 && point!.1 - 1 >= 0 {
                if !blueList!.contains(where: {(position) -> Bool in
                    return position == (point!.0 - 1,point!.1)
                }) && !redList!.contains(where: {(position) in
                    return position == (point!.0 - 1,point!.1)
                }) {
                    canMovePositions.append((point!.0 - 2,point!.1 - 1))
                }
            }
            //右上
            if point!.0 + 2 <= 8 && point!.1 - 1 >= 0{
                if !blueList!.contains(where: {(position) -> Bool in
                    return position == (point!.0 + 1,point!.1)
                }) && !redList!.contains(where: {(position) in
                    return position == (point!.0 + 1,point!.1)
                }) {
                    canMovePositions.append((point!.0 + 2,point!.1 - 1))
                }
            }
            //左下
            if point!.0 - 2 >= 0 && point!.1 + 1 <= 9{
                if !blueList!.contains(where: {(position) -> Bool in
                    return position == (point!.0 - 1,point!.1)
                }) && !redList!.contains(where: {(position) in
                    return position == (point!.0 - 1,point!.1)
                }) {
                    canMovePositions.append((point!.0 - 2,point!.1 + 1))
                }
            }
            //右下
            if point!.0 + 2 <= 8 && point!.1 + 1 <= 9{
                if !blueList!.contains(where: {(position) -> Bool in
                    return position == (point!.0 + 1,point!.1)
                }) && !redList!.contains(where: {(position) in
                    return position == (point!.0 + 1,point!.1)
                }) {
                    canMovePositions.append((point!.0 + 2,point!.1 + 1))
                }
            }
            
        }
        if chessName == "車" || chessName == "车"{
            let redList = chessBoard?.getAllRedChessMatrixList()
            let blueList = chessBoard?.getAllBlueChessMatrixList()
            var tempPoint:(Int,Int) = point!
            //横向
            //左
            while tempPoint.0 - 1 >= 0 {
                if redList!.contains(where: {(position) in
                    return position == (tempPoint.0 - 1,tempPoint.1)
                }) || blueList!.contains(where: {(position) in
                    return position == (tempPoint.0 - 1,tempPoint.1)
                }){
                    canMovePositions.append((tempPoint.0 - 1,tempPoint.1))
                    break
                }else{
                    canMovePositions.append((tempPoint.0 - 1,tempPoint.1))
                }
                tempPoint = (tempPoint.0 - 1,tempPoint.1)
            }
            //右
            tempPoint = point!
            while tempPoint.0 + 1 <= 8 {
                if redList!.contains(where: {(position) in
                    return position == (tempPoint.0 + 1,tempPoint.1)
                }) || blueList!.contains(where: {(position) in
                    return position == (tempPoint.0 + 1,tempPoint.1)
                }){
                    break
                }else{
                    canMovePositions.append((tempPoint.0 + 1,tempPoint.1))
                }
                tempPoint = (tempPoint.0 + 1,tempPoint.1)
            }
            //竖向
            //上
            tempPoint = point!
            while tempPoint.1 - 1 >= 0 {
                if redList!.contains(where: {(position) in
                    return position == (tempPoint.0,tempPoint.1 - 1)
                }) || blueList!.contains(where: {(position) in
                    return position == (tempPoint.0,tempPoint.1 - 1)
                }){
                    canMovePositions.append((tempPoint.0,tempPoint.1 - 1))
                    break
                }else{
                    canMovePositions.append((tempPoint.0,tempPoint.1 - 1))
                }
                tempPoint = (tempPoint.0,tempPoint.1 - 1)
            }
            //下
            tempPoint = point!
            while tempPoint.1 + 1 <= 9 {
                if redList!.contains(where: {(position) in
                    return position == (tempPoint.0,tempPoint.1 + 1)
                }) || blueList!.contains(where: {(position) in
                    return position == (tempPoint.0,tempPoint.1 + 1)
                }){
                    canMovePositions.append((tempPoint.0,tempPoint.1 + 1))
                    break
                }else{
                    canMovePositions.append((tempPoint.0,tempPoint.1 + 1))
                }
                tempPoint = (tempPoint.0,tempPoint.1 + 1)
            }
            print(canMovePositions)
        }
        chessBoard?.showChessItemCanMovePosition(canMovePositions: canMovePositions, chessItem: chessItem)
    }
    
    func onChessMoveEnd() {
        isRedMove = !isRedMove
        chessBoard?.cancelAllSelect()
    }
    

}
