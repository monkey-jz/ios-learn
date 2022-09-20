//
//  EnemyNode.swift
//  TextShooter
//
//  Created by boyaa on 2022/9/19.
//

import SpriteKit

class EnemyNode: SKNode {
    
    override init() {
        super.init()
        initNodeGraphic()
        initPhysicsBody()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initNodeGraphic() {
        let topRow = SKLabelNode(fontNamed: "Chalkduster")
        topRow.fontColor = SKColor.brown
        topRow.text = "x x"
        topRow.fontSize = 20
        topRow.position = CGPoint(x: 0, y: 15)
        addChild(topRow)
        
        let midRow = SKLabelNode(fontNamed: "Chalkduster")
        midRow.fontColor = SKColor.brown
        midRow.fontSize = 20
        midRow.text = "x"
        addChild(midRow)
        
        let bottomRow = SKLabelNode(fontNamed: "Chalkduster")
        bottomRow.fontColor = SKColor.brown
        bottomRow.fontSize = 20
        bottomRow.text = "x x"
        bottomRow.position = CGPoint(x: 0, y: -15)
        addChild(bottomRow)
        
    }
    
    func initPhysicsBody() {
        let body = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 40))
        body.affectedByGravity = false
        body.categoryBitMask = EnemyCategory
        body.contactTestBitMask = PlayerCategory | EnemyCategory
        body.mass = 0.2
        body.angularDamping = 0
        body.linearDamping = 0
        body.fieldBitMask = 0
        self.physicsBody = body
    }
    
}
