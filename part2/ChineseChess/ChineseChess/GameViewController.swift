//
//  GameViewController.swift
//  ChineseChess
//
//  Created by boyaa on 2022/8/24.
//

import UIKit

class GameViewController: UIViewController,GameEngineDelegate {
    var chessBoard: ChessBoard!
    var tipButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named: "gameBg"))
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        self.view.backgroundColor = UIColor.white
        addChessBoard()
        addRestartBtn()
        addTipBtn()
    }
    
    func addChessBoard() {
        chessBoard = ChessBoard(origin: CGPoint(x: 20, y: 0))
        chessBoard.center = self.view.center
        let gameEngine = GameEngine(chessBoard: chessBoard)
        chessBoard.delegate = gameEngine
        gameEngine.setRedFirstMove(redFirstMove: true)
        gameEngine.delegate = self
       
        self.view.addSubview(chessBoard)
    }
    
    func addRestartBtn() {
        let btn = UIButton(frame: CGRect(x: self.view.bounds.midX - 110, y: self.view.frame.height - 100, width: 100, height: 30))
        btn.setTitle("重新开始", for:.normal)
        btn.addTarget(self, action: #selector(onRestartBtnClick(btn:)), for: .touchUpInside)
        btn.setTitleColor(UIColor.systemBlue, for: .normal)
        btn.setTitleColor(UIColor.cyan, for: .highlighted)
        self.view.addSubview(btn)
    }
    
    func addTipBtn() {
        tipButton = UIButton(frame: CGRect(x: self.view.bounds.midX + 10, y: self.view.frame.height - 100, width: 100, height: 30))
        tipButton.setTitle("红方行棋", for:.normal)
        tipButton.addTarget(self, action: #selector(onTipBtnClick(btn:)), for: .touchUpInside)
        tipButton.setTitleColor(UIColor.systemBlue, for: .normal)
        tipButton.setTitleColor(UIColor.cyan, for: .highlighted)
        self.view.addSubview(tipButton)
    }
    
    @objc func onRestartBtnClick(btn: UIButton) {
        chessBoard.restartGame()
    }
    
    @objc func onTipBtnClick(btn: UIButton) {
        
    }
    
    func onChessItemClick(chessItem: ChessItem) {
        if chessItem.isRed! {
            tipButton.setTitle("蓝方行棋" ,for: .normal)
        }else {
            tipButton.setTitle("红方行棋" ,for: .normal)
        }
    }
    func gameOver(winer: ROLE) {
        switch winer {
        case .RED:
            tipButton.setTitle("红方赢" ,for: .normal)
        case .BLUE:
            tipButton.setTitle("蓝方赢" ,for: .normal)
        }
    }
}
