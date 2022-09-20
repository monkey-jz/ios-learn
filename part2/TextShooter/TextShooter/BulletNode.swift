//
//  BulletNode.swift
//  TextShooter
//
//  Created by boyaa on 2022/9/19.
//

import SpriteKit

class BulletNode: SKNode {
    var thrust: CGVector = CGVector(dx: 0, dy: 0)
    
    override init() {
        super.init()
        let dot = SKLabelNode(fontNamed: "Chalkduster")
        dot.text = "."
        dot.fontSize = 40
        dot.fontColor = SKColor.black
        addChild(dot)
        
        let body = SKPhysicsBody(circleOfRadius: 1)
        body.isDynamic = true
        body.categoryBitMask = PlayerMissileCategory
        body.contactTestBitMask = EnemyCategory
        body.collisionBitMask = EnemyCategory
        body.fieldBitMask = GravityFiledCategary
        body.mass = 0.01
        self.physicsBody = body
        self.name = "Bullet \(self)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let dx = aDecoder.decodeFloat(forKey: "thrustX")
        let dy = aDecoder.decodeFloat(forKey: "thrustY")
        thrust = CGVector(dx: CGFloat(dx), dy: CGFloat(dy))
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(Float(thrust.dx), forKey: "thrustX")
        coder.encode(Float(thrust.dy), forKey: "thrustY")

    }
    
    class func bullet(from start: CGPoint,toward destination: CGPoint) -> BulletNode {
        let bullet = BulletNode()
        bullet.position = start
        let movement = vectorBetweenPoints(start, destination)
        let magnitude = vectorLength(movement)
        let scaledMovement = vectorMultiply(movement, 1 / magnitude)
        let thrustMagniude = CGFloat(100.0)
        bullet.thrust = vectorMultiply(scaledMovement, thrustMagniude)
      
        bullet.run(SKAction.sequence([
            SKAction.fadeIn(withDuration: 0.5),
                   
            SKAction.fadeOut(withDuration: 0.5),
                  
               ]))
        return bullet
    }
    
    func applayRecurringForce() {
        physicsBody?.applyForce(thrust)
    }

}
