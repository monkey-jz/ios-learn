//
//  GameEngine.swift
//  ChineseChess
//
//  Created by boyaa on 2022/8/25.
//

import UIKit

protocol GameEngineDelegate {
    func onChessItemClick(chessItem: ChessItem)
    func gameOver(winer: ROLE)
}

class GameEngine: NSObject,ChessBoardProtocol {
   
    var chessBoard: ChessBoard?
    var delegate: GameEngineDelegate?
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
        if delegate != nil {
            delegate?.onChessItemClick(chessItem: chessItem)
        }
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
                    canMovePositions.append((tempPoint.0 + 1,tempPoint.1))
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
           
        }
        if chessName == "炮" {
            let redList = chessBoard?.getAllRedChessMatrixList()
            let blueList = chessBoard?.getAllBlueChessMatrixList()
            
            var tempPoint:(Int,Int) = point!
            //横向
            //左
            var leftCanMovePositions :[(Int,Int)] = Array<(Int,Int)>()
            while tempPoint.0 - 1 >= 0 {
                if redList!.contains(where: {(position) in
                    return position == (tempPoint.0 - 1,tempPoint.1)
                }) || blueList!.contains(where: {(position) in
                    return position == (tempPoint.0 - 1,tempPoint.1)
                }){
                    break
                }else{
                    leftCanMovePositions.append((tempPoint.0 - 1,tempPoint.1))
                }
                tempPoint = (tempPoint.0 - 1,tempPoint.1)
            }
            var bridgePoint: (Int,Int)!
            if !leftCanMovePositions.isEmpty {
                bridgePoint = (leftCanMovePositions.last!.0 - 1,leftCanMovePositions.last!.1)
            }else {
                bridgePoint = (point!.0 - 1,point!.1)
            }
            if bridgePoint.0 >= 1 && bridgePoint.1 == point!.1{
               while bridgePoint.0 - 1 >= 0 {
                    if blueList!.contains(where: {(position) in
                        return position == (bridgePoint.0 - 1,bridgePoint.1)
                    }) || redList!.contains(where: {(position) in
                        return position == (bridgePoint.0 - 1,bridgePoint.1)
                    }) {
                        leftCanMovePositions.append((bridgePoint.0 - 1,bridgePoint.1))
                        break
                    }
                    bridgePoint = (bridgePoint.0 - 1,bridgePoint.1)
                }
           }
            //右
            tempPoint = point!
            var rightCanMovePositions :[(Int,Int)] = Array<(Int,Int)>()
            while tempPoint.0 + 1 <= 8 {
                if redList!.contains(where: {(position) in
                    return position == (tempPoint.0 + 1,tempPoint.1)
                }) || blueList!.contains(where: {(position) in
                    return position == (tempPoint.0 + 1,tempPoint.1)
                }){
                    break
                }else{
                    rightCanMovePositions.append((tempPoint.0 + 1,tempPoint.1))
                }
                tempPoint = (tempPoint.0 + 1,tempPoint.1)
            }
            if !rightCanMovePositions.isEmpty {
               bridgePoint = (rightCanMovePositions.last!.0 + 1,rightCanMovePositions.last!.1)
            }else {
               bridgePoint = (point!.0 + 1,point!.1)
            }
            if bridgePoint.0 <= 7 && bridgePoint.1 == point!.1{
                while bridgePoint.0 + 1 <= 8 {
                    if blueList!.contains(where: {(position) in
                        return position == (bridgePoint.0 + 1,bridgePoint.1)
                    }) || redList!.contains(where: {(position) in
                        return position == (bridgePoint.0 + 1,bridgePoint.1)
                    }){
                        rightCanMovePositions.append((bridgePoint.0 + 1,bridgePoint.1))
                        break
                    }
                bridgePoint = (bridgePoint.0 + 1,bridgePoint.1)
                }
            }
            //竖向
            //上
            tempPoint = point!
            var upCanMovePositions :[(Int,Int)] = Array<(Int,Int)>()
            while tempPoint.1 - 1 >= 0 {
                if redList!.contains(where: {(position) in
                    return position == (tempPoint.0,tempPoint.1 - 1)
                }) || blueList!.contains(where: {(position) in
                    return position == (tempPoint.0,tempPoint.1 - 1)
                }){
                    break
                }else{
                    upCanMovePositions.append((tempPoint.0,tempPoint.1 - 1))
                }
                tempPoint = (tempPoint.0,tempPoint.1 - 1)
            }
            if !upCanMovePositions.isEmpty {
                bridgePoint = (upCanMovePositions.last!.0,upCanMovePositions.last!.1 - 1)
            }else {
                bridgePoint = (point!.0,point!.1 - 1)
            }
            if bridgePoint.1 >= 1 && bridgePoint.0 == point!.0{
               while bridgePoint.1 - 1 >= 0 {
                    if blueList!.contains(where: {(position) in
                        return position == (bridgePoint.0,bridgePoint.1 - 1)
                    }) || redList!.contains(where: {(position) in
                        return position == (bridgePoint.0 + 1,bridgePoint.1)
                    }){
                        upCanMovePositions.append((bridgePoint.0,bridgePoint.1 - 1))
                        break
                    }
                    bridgePoint = (bridgePoint.0,bridgePoint.1 - 1)
                }
            }
            
            //下
            tempPoint = point!
            var downCanMovePositions :[(Int,Int)] = Array<(Int,Int)>()
            while tempPoint.1 + 1 <= 9 {
                if redList!.contains(where: {(position) in
                    return position == (tempPoint.0,tempPoint.1 + 1)
                }) || blueList!.contains(where: {(position) in
                    return position == (tempPoint.0,tempPoint.1 + 1)
                }) {
                    break
                }else{
                    downCanMovePositions.append((tempPoint.0,tempPoint.1 + 1))
                }
                tempPoint = (tempPoint.0,tempPoint.1 + 1)
            }
            if !downCanMovePositions.isEmpty {
                bridgePoint = (downCanMovePositions.last!.0,downCanMovePositions.last!.1 + 1)
            }else {
                bridgePoint = (point!.0,point!.1 + 1)
            }
            if bridgePoint.1 <= 8 && bridgePoint.0 == point!.0{
               while bridgePoint.1 + 1 <= 9 {
                    if blueList!.contains(where: {(position) in
                        return position == (bridgePoint.0,bridgePoint.1 + 1)
                    }) || redList!.contains(where: {(position) in
                        return position == (tempPoint.0,tempPoint.1 + 1)
                    }){
                        downCanMovePositions.append((bridgePoint.0,bridgePoint.1 + 1))
                        break
                    }
                    bridgePoint = (bridgePoint.0,bridgePoint.1 + 1)
                }
           }
            canMovePositions.append(contentsOf: leftCanMovePositions)
            canMovePositions.append(contentsOf: rightCanMovePositions)
            canMovePositions.append(contentsOf: upCanMovePositions)
            canMovePositions.append(contentsOf: downCanMovePositions)
        }
        chessBoard?.showChessItemCanMovePosition(canMovePositions: canMovePositions, chessItem: chessItem)
    }
    
    func onChessMoveEnd() {
        isRedMove = !isRedMove
        chessBoard?.cancelAllSelect()
    }
    
    func gameOver(winer: ROLE) {
        if delegate != nil {
            delegate?.gameOver(winer: winer)
        }
    }
    

}
