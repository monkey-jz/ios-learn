//
//  GameScene2.swift
//  TextShooter
//
//  Created by boyaa on 2022/9/19.
//

import SpriteKit

class GameScene2: SKScene,SKPhysicsContactDelegate {

    private var levelNumber: Int
    private var playerLives: Int {
        didSet{
            
            let lives = childNode(withName: "LivesLable") as! SKLabelNode
            lives.text = "Lives: \(playerLives)"
        }
    }
    private var finished = false
    private let playerNode = PlayerNode()
    private let enemies = SKNode()
    private let playerBullets = SKNode()
    
    class func scene(size: CGSize,levelNumber: Int) -> GameScene2 {
        return GameScene2(size: size,levelNumber: levelNumber)
    }
    

    override convenience init(size: CGSize) {
        self.init(size: size,levelNumber: 1)
    
    }
    
    init(size: CGSize,levelNumber: Int) {
        finished = false
        self.levelNumber = levelNumber
        self.playerLives = 5
        super.init(size: size)
    
        backgroundColor = SKColor.lightGray
        
        let lives = SKLabelNode(fontNamed: "Chalkduster")
        lives.fontSize = 16
        lives.fontColor = SKColor.black
        lives.name = "LivesLable"
        lives.text = "Lives: \(playerLives)"
        lives.verticalAlignmentMode = .top
        lives.horizontalAlignmentMode = .right
        lives.position = CGPoint(x: frame.size.width , y: frame.size.height)
        addChild(lives)
        
        let level = SKLabelNode(fontNamed: "Chalkduster")
        level.fontSize = 16
        level.fontColor = SKColor.black
        level.name = "LevelLable"
        level.text = "Level: \(levelNumber)"
        level.verticalAlignmentMode = .top
        level.horizontalAlignmentMode = .left
        level.position = CGPoint(x: 0 , y: frame.size.height)
        addChild(level)
        playerNode.position = CGPoint(x: frame.midX, y: frame.height * 0.1)
        addChild(playerNode)
        
        addChild(enemies)
        spawnEnemies()
        
        addChild(playerBullets)
        createForceFileds()
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -1)
        self.physicsWorld.contactDelegate = self
    }
    
    func createForceFileds() {
        
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(Int(levelNumber), forKey: "level")
        coder.encode(playerLives, forKey: "playerLives")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if location.y < frame.height * 0.2 {
                let target = CGPoint(x: location.x, y: location.y)
                playerNode.moveToward(target)
            }else {
                let bullet = BulletNode.bullet(from: playerNode.position, toward: location)
                playerBullets.addChild(bullet)
            }
        }
        
    }
    
    private func spawnEnemies() {
        let count = Int(log(Float(levelNumber))) + levelNumber
        for _ in 0..<count {
            let enemy = EnemyNode()
            let size = frame.size
            let x = arc4random_uniform(UInt32(size.width * 0.8)) + UInt32(size.width * 0.1)
            let y = arc4random_uniform(UInt32(size.height * 0.5)) + UInt32(size.height * 0.5)
            enemy.position = CGPoint(x: CGFloat(x), y: CGFloat(y))
            enemies.addChild(enemy)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if finished {
            return
        }
        updateBullets()
        updateEnemies()
        if !checkForGameOver() {
            checkForNextLevel()
        }
        
    }
    
    private func updateBullets() {
        var bulletsToRemove: [BulletNode] = []
        for bullet in playerBullets.children as! [BulletNode] {
            if !self.frame.contains(bullet.position) {
                bulletsToRemove.append(bullet)
                continue
            }
            bullet.applayRecurringForce()
        }
        playerBullets.removeChildren(in: bulletsToRemove)
    }
    
    private func updateEnemies() {
        var enemiesToRemove: [EnemyNode] = []
        for enemy in enemies.children as! [EnemyNode] {
            if !self.frame.contains(enemy.position) {
                enemiesToRemove.append(enemy)
                continue
            }
        }
        enemies.removeChildren(in: enemiesToRemove)
    }
    
    private func checkForNextLevel() {
        if enemies.children.isEmpty {
            finished = true
            gotoNextLevel()
        }
    }
    
    private func gotoNextLevel() {
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = "过关"
        label.fontColor = SKColor.purple
        label.fontSize = 32
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(label)
        let nextLevel = GameScene2(size: frame.size, levelNumber: levelNumber + 1)
        nextLevel.playerLives = playerLives
        self.view?.presentScene(nextLevel, transition: SKTransition.flipVertical(withDuration: 1.0))
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == contact.bodyB.categoryBitMask {
            let nodeA = contact.bodyA.node!
            let nodeB = contact.bodyB.node!
            nodeA.friendlyBumpFrom(nodeB)
            nodeB.friendlyBumpFrom(nodeA)
            
        }else{
            var attacker: SKNode
            var attackee: SKNode
            if contact.bodyA.categoryBitMask > contact.bodyB.categoryBitMask {
                attacker = contact.bodyA.node!
                attackee = contact.bodyB.node!
            }else {
                attacker = contact.bodyB.node!
                attackee = contact.bodyA.node!
            }
            if attackee is PlayerNode {
                playerLives -= 1
            }
            attackee.receiveAttacker(attacker, contact: contact)
            playerBullets.removeChildren(in: [attacker])
            enemies.removeChildren(in: [attacker])
        }
    }
    
    private func triggerGameOver() {
        finished = true
        let path = Bundle.main.path(forResource: "EnemyExplosion", ofType: "sks")
        let explosion = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
        explosion.numParticlesToEmit = 200
        explosion.position = playerNode.position
        scene?.addChild(explosion)
        let gameOverScene = GameOverScene(size: frame.size)
        view?.presentScene(gameOverScene, transition: SKTransition.doorsOpenVertical(withDuration: 1))
        
    }
    
    private func checkForGameOver() -> Bool {
        if playerLives == 0 {
            triggerGameOver()
            return true
        }
        return false
    }

    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
