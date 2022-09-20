//
//  SKNode+Extra.swift
//  TextShooter
//
//  Created by boyaa on 2022/9/20.
//

import SpriteKit

extension SKNode {
    
    @objc func receiveAttacker(_ attacker: SKNode,contact: SKPhysicsContact) {
        self.physicsBody?.affectedByGravity = true
        let force = vectorMultiply(attacker.physicsBody!.velocity, contact.collisionImpulse)
        let myContact = self.scene!.convert(contact.contactPoint, to: self)
        physicsBody!.applyForce(force,at: myContact)
        let path = Bundle.main.path(forResource: "MissileExplosion", ofType: "sks")
        let explosion = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
        explosion.numParticlesToEmit = 20
        explosion.position = contact.contactPoint
        self.scene?.addChild(explosion)
        
    }
    
    func friendlyBumpFrom(_ node: SKNode) {
        self.physicsBody?.affectedByGravity = true
    }
}
