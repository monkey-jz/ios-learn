//
//  GameViewController2.swift
//  TextShooter
//
//  Created by boyaa on 2022/9/19.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        
        let start = StartScene(size: self.view.frame.size)
        skView.presentScene(start)
       
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
