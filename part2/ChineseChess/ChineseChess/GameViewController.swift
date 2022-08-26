//
//  GameViewController.swift
//  ChineseChess
//
//  Created by boyaa on 2022/8/24.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named: "gameBg"))
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        self.view.backgroundColor = UIColor.white
        let chessBoard = ChessBoard(origin: CGPoint(x: 20, y: 0))
        chessBoard.center = self.view.center
        let gameEngine = GameEngine(chessBoard: chessBoard)
        chessBoard.delegate = gameEngine
        gameEngine.setRedFirstMove(redFirstMove: true)
       
        self.view.addSubview(chessBoard)
        
    }
    @objc func onChessClick(chessItem: ChessItem) {
        if chessItem.isSelecte {
            chessItem.setUnSelectedState()
        }else{
            chessItem.setSelectedState()
        }
    }
}
