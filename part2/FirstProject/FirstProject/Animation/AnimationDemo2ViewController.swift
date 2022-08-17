//
//  AnimationDemo2ViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/12.
//

import UIKit

class AnimationDemo2ViewController: UIViewController {

    override func viewDidLoad() {
        
       super.viewDidLoad()
        
//        let proAnimation = getKeyFrameAnimation()
        
//        playSprintAnimation()
       
        addView()

    }
    
    func addView() {
        
    }
    
    func getBasicAnimation(){
        let basicAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        basicAnimation.fromValue = 0
        basicAnimation.toValue = NSNumber(value: Double.pi)
        basicAnimation.duration = 3
        basicAnimation.repeatCount = Float.infinity
        self.view.layer.add(basicAnimation, forKey: nil)
    
    }
    
    func getKeyFrameAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [NSNumber(value: 0),NSNumber(value: Double.pi / 4),NSNumber(value: -Double.pi * 2),NSNumber(value: Double.pi * 20)]
        animation.duration = 3
//        animation.repeatCount = Float.infinity
        self.view.layer.add(animation, forKey: nil)
        
    }
    
    func playSprintAnimation(){
        let btn = UIButton(frame: CGRect(x: 20, y: 30, width: 50, height: 60))
        btn.backgroundColor = UIColor.cyan
        self.view.addSubview(btn)
        
        let springAnimation = CASpringAnimation(keyPath: "position.y")
        springAnimation.mass = 4
        springAnimation.stiffness = 6
        springAnimation.damping = 2
        springAnimation.toValue = 300
        springAnimation.duration = 3
        springAnimation.repeatCount = 10000
        springAnimation.autoreverses = true
        let layer = CALayer()
        layer.position = CGPoint(x: 50, y: 60)
        layer.bounds = CGRect(x: 0, y: 0, width: 50, height: 60)
        layer.backgroundColor = UIColor.brown.cgColor
        layer.add(springAnimation, forKey: "")
        self.view.layer.addSublayer(layer)
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let transition = CATransition()
//        transition.type = .reveal
//        transition.subtype = .fromTop
//        let layer = CALayer()
//        layer.position = CGPoint(x: 200 , y: 300)
//        layer.bounds = CGRect(x: 0, y: 0, width: 200, height: 300)
//        layer.backgroundColor = UIColor.black.cgColor
//        layer.add(transition, forKey: "")
        
        let basicAnimation1 = CABasicAnimation(keyPath: "backgroundColor")
        basicAnimation1.fromValue = UIColor.purple.cgColor
        let basicAnimation2 = CABasicAnimation(keyPath: "transform.scale.x")
        basicAnimation2.toValue = NSNumber(value: 0.5)
        let basicAnimation3 = CABasicAnimation(keyPath: "transform.scale.y")
        basicAnimation3.toValue = NSNumber(value: 0.5)
        let basicAnimation4 = CABasicAnimation(keyPath: "backgroundColor")
        basicAnimation4.toValue = UIColor.cyan.cgColor
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [basicAnimation1 ,basicAnimation2,basicAnimation3,basicAnimation4]
        animationGroup.duration = 1
        animationGroup.repeatCount = 10000
        animationGroup.autoreverses = true
        let layer = CALayer()
        layer.position = CGPoint(x: 200, y: 200)
        layer.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        layer.backgroundColor = UIColor.purple.cgColor
        layer.add(animationGroup, forKey: "")
        self.view.layer.addSublayer(layer)
    }
    

  

}
