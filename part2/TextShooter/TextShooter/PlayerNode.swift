//
//  PlayerNode.swift
//  TextShooter
//
//  Created by boyaa on 2022/9/19.
//

import SpriteKit

class PlayerNode: SKNode {
    override init() {
        super.init()
        name = "Player \(self)"
        
        initNodeGraphic()
        initPhysicsBody()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initNodeGraphic() {
        let labelNode = SKLabelNode(fontNamed: "Chalkduster")
        labelNode.fontSize = 16
        labelNode.fontColor = SKColor.darkGray
        labelNode.name = "label"
        labelNode.text = "v"
        labelNode.zRotation = CGFloat(Double.pi)
        self.addChild(labelNode)
    }
    func initPhysicsBody() {
        let body = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
        body.affectedByGravity = false
        body.categoryBitMask = PlayerCategory
        body.contactTestBitMask = EnemyCategory
        body.collisionBitMask = 0
        body.fieldBitMask = 0
        self.physicsBody = body
    }
    
    func moveToward(_ location: CGPoint) {
        removeAction(forKey: "movement")
        removeAction(forKey: "wobbling")
        let distance = pointDistance(self.position,location)
        let screenWidth = UIScreen.main.bounds.size.width
        let duration = TimeInterval(distance / screenWidth)
        run(SKAction.move(to: location, duration: duration),withKey: "movement")
        
        let wobbleTime = 0.2
        let halfWobbleTime = wobbleTime / 2
        let wobbling = SKAction.sequence([
            SKAction.scaleX(to: 0.2, duration: halfWobbleTime),
            SKAction.scaleX(to: 1.0, duration: halfWobbleTime)
        ])
        let wobbleCount = Int(duration / wobbleTime)
        run(SKAction.repeat(wobbling, count: wobbleCount),withKey: "wobbling")
    }
    
    override func receiveAttacker(_ attacker: SKNode,contact: SKPhysicsContact) {
      
        let path = Bundle.main.path(forResource: "EnemyExplosion", ofType: "sks")
        let explosion = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
        explosion.numParticlesToEmit = 50
        explosion.position = contact.contactPoint
        self.scene?.addChild(explosion)
        
    }
}
