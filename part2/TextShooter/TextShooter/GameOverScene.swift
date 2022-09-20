//
//  GameOverScene.swift
//  TextShooter
//
//  Created by boyaa on 2022/9/20.
//

import SpriteKit

class GameOverScene: SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = SKColor.orange
        let text = SKLabelNode(fontNamed: "")
        text.text = "游戏结束"
        text.fontSize = 50
        text.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMove(to view: SKView) {
        let start = StartScene(size: frame.size)
        view.presentScene(start, transition: SKTransition.flipVertical(withDuration: 1))
    }

}
