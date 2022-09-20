//
//  StartScene.swift
//  TextShooter
//
//  Created by boyaa on 2022/9/20.
//

import SpriteKit

class StartScene: SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = SKColor.yellow
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = "TextShooter"
        label.fontColor = SKColor.black
        label.fontSize = 48
        label.position = CGPoint(x: frame.midX, y: frame.midY * 1.5)
        addChild(label)
        
        let bottomLabel = SKLabelNode(fontNamed: "Chalkduster")
        bottomLabel.text = "点击任何地方开始游戏"
        bottomLabel.fontColor = SKColor.black
        bottomLabel.fontSize = 20
        bottomLabel.position = CGPoint(x: frame.midX, y: frame.midY * 0.5)
        addChild(bottomLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.doorway(withDuration: 1.0)
        let game = GameScene2(size: frame.size,levelNumber: 1)
        game.scaleMode = .aspectFill
        view?.presentScene(game, transition: transition)
    }
    
}
