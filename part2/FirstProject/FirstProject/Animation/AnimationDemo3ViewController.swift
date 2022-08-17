//
//  AnimationDemo3ViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/12.
//

import UIKit

class AnimationDemo3ViewController: UIViewController {

    @IBOutlet weak var rainBtn: UIButton!
    @IBOutlet weak var centerHeartButton: UIButton!

    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    
    @IBOutlet weak var progressBtn: UIButton!
    @IBOutlet weak var gravityBtn: UIButton!
    var rainLayer: CAEmitterLayer!
    var centerHeartLayer: CAEmitterLayer!
    var leftHeartLayer: CAEmitterLayer!
    var rightHeartLayer: CAEmitterLayer!
    var gravityLayer: CAEmitterLayer!
    var progressLayer: CAEmitterLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupRainLayer()
        setupCenterHeartLayer()
        setupLeftHeartLayer()
        setupRightHeartLayer()
        setupGravityLayer()
        setupProgressLayer()

    }
    
    func setupRainLayer() {
        
        rainLayer = CAEmitterLayer()
        rainLayer.emitterPosition = CGPoint(x: self.view.bounds.midX, y: 0)
        rainLayer.emitterSize = CGSize(width: self.view.frame.size.width - 40, height: 0)
        rainLayer.renderMode = .oldestFirst
        rainLayer.emitterMode = .outline
        rainLayer.birthRate = 0
        rainLayer.emitterShape = .line
        let cell = CAEmitterCell()
        cell.contents = #imageLiteral(resourceName: "Heart_red").cgImage
        cell.scale = 0.5
        cell.lifetime = 6
        cell.birthRate = 5
        cell.velocity = 350
        cell.emissionLongitude = CGFloat.pi
        rainLayer.emitterCells = [cell]
        view.layer.addSublayer(rainLayer!)
    }
    
    private func setupCenterHeartLayer() {
         centerHeartLayer = CAEmitterLayer()
         centerHeartLayer.emitterShape = .circle
        centerHeartLayer.emitterMode = .outline
         centerHeartLayer.renderMode = .oldestFirst
         centerHeartLayer.emitterPosition = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
         centerHeartLayer.emitterSize = centerHeartButton.frame.size
         centerHeartLayer.birthRate = 0
         
         let cell = CAEmitterCell()
         cell.contents = #imageLiteral(resourceName: "Heart_red").cgImage
         cell.lifetime = 1
         cell.birthRate = 5000
         cell.scale = 0.05
         cell.scaleSpeed = 0
         cell.alphaSpeed = -2
         cell.velocity = 20
         
         centerHeartLayer.emitterCells = [cell]
         view.layer.addSublayer(centerHeartLayer)
     }
    
    private func setupLeftHeartLayer(){
        leftHeartLayer = CAEmitterLayer()
        leftHeartLayer.emitterShape = .point // default value, emit orientation is right
        leftHeartLayer.emitterMode = .volume // default value
        leftHeartLayer.renderMode = .oldestLast
           leftHeartLayer.emitterPosition = CGPoint(x: view.bounds.midX * 0.5, y: view.bounds.midY)
           leftHeartLayer.birthRate = 0
           
           let cell = CAEmitterCell()
           cell.contents = #imageLiteral(resourceName: "Heart_red").cgImage
           cell.scale = 0.5
           cell.lifetime = 7
           cell.birthRate = 3
           cell.alphaSpeed = -0.1
           cell.velocity = 50
           cell.emissionLongitude = -CGFloat.pi / 2
           cell.emissionRange = CGFloat.pi / 4
           leftHeartLayer.emitterCells = [cell]
           view.layer.addSublayer(leftHeartLayer)
    }
    
    private func setupRightHeartLayer() {
        rightHeartLayer = CAEmitterLayer()
        rightHeartLayer.renderMode = .oldestLast
        rightHeartLayer.emitterPosition = CGPoint(x: view.bounds.midX * 1.5, y: view.bounds.midY)
        rightHeartLayer.birthRate = 0
        
        let cell = CAEmitterCell()
        cell.contents = #imageLiteral(resourceName: "Heart_red").cgImage
        cell.scale = 0.5
        cell.lifetime = 10
        cell.birthRate = 5
        cell.alphaSpeed = -0.1
        cell.velocity = 50
        cell.emissionLongitude = -CGFloat.pi / 2
        cell.emissionRange = CGFloat.pi / 4
        
        rightHeartLayer.emitterCells = [cell]
        view.layer.addSublayer(rightHeartLayer)
    }
    
    private func setupGravityLayer() {
        gravityLayer = CAEmitterLayer()
        gravityLayer.renderMode = .oldestLast
        gravityLayer.emitterPosition = CGPoint(x: 0, y: view.bounds.maxY)
        gravityLayer.birthRate = 0
        
        let cell = CAEmitterCell()
        cell.contents = #imageLiteral(resourceName: "Heart_red").cgImage
        cell.scale = 0.5
        cell.lifetime = 10
        cell.alphaSpeed = -0.1
        cell.birthRate = 10
        cell.velocity = 100
        cell.yAcceleration = 20
        cell.emissionLongitude = -CGFloat.pi / 4
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 0 // default value
        cell.spinRange = CGFloat.pi * 2
        
        let cell2 = CAEmitterCell()
        cell2.contents = #imageLiteral(resourceName: "Heart_blue").cgImage
        cell2.scale = 0.3
        cell2.lifetime = 20
        cell2.alphaSpeed = -0.05
        cell2.birthRate = 5
        cell2.velocity = 135
        cell2.yAcceleration = 20
        cell2.emissionLongitude = -CGFloat.pi / 4
        cell2.emissionRange = CGFloat.pi / 4
        cell2.spin = 0 // default value
        cell2.spinRange = CGFloat.pi * 2
        
        gravityLayer.emitterCells = [cell, cell2]
        view.layer.addSublayer(gravityLayer)
    }
    
    func setupProgressLayer() {
        
        progressLayer = CAEmitterLayer()
        progressLayer.emitterPosition = CGPoint(x: self.view.bounds.midX, y:self.view.bounds.midY / 2)
        progressLayer.emitterSize = CGSize(width: 0, height: 100)
        progressLayer.renderMode = .oldestLast
        progressLayer.emitterMode = .volume
        progressLayer.birthRate = 0
        progressLayer.emitterShape = .line
        let cell = CAEmitterCell()
        cell.contents = #imageLiteral(resourceName: "Heart_red").cgImage
        cell.scale = 0.1
        cell.lifetime = 1.5
        cell.alphaSpeed = -0.9
        cell.birthRate = 10
        cell.velocity = 50
        cell.yAcceleration = 5
        cell.emissionLongitude = -CGFloat.pi / 2
        cell.emissionRange = CGFloat.pi / 8
        cell.spin = 0 // default value
        cell.spinRange = CGFloat.pi * 2
        progressLayer.emitterCells = [cell]
        view.layer.addSublayer(progressLayer!)
    }
    
    @IBAction func rainBtnClick(_ sender: Any) {
        //rainBtn.isUserInteractionEnabled = false
              let birthRateAnimation = CABasicAnimation(keyPath: "birthRate")
              birthRateAnimation.duration = 1
              if rainLayer.birthRate == 0 {
                  birthRateAnimation.fromValue = 0
                  birthRateAnimation.toValue = 1
                  rainLayer.birthRate = 1
              } else {
                  birthRateAnimation.fromValue = 1
                  birthRateAnimation.toValue = 0
                  rainLayer.birthRate = 0
              }
              rainLayer.add(birthRateAnimation, forKey: "birthRate")
              DispatchQueue.main.asyncAfter(deadline: .now() + birthRateAnimation.duration) { [weak self] in
                  guard self != nil else { return }
                  self!.rainBtn.isUserInteractionEnabled = true
              }
    }
    
    
    @IBAction func redHeartClick(_ sender: Any) {
        centerHeartButton.isUserInteractionEnabled = false
              centerHeartLayer.beginTime = CACurrentMediaTime() // There will be too many cell without setting begin time
              centerHeartLayer.birthRate = 1
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                  guard let strongSelf = self else { return }
                  strongSelf.centerHeartLayer.birthRate = 0
              }
              DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                  guard self != nil else { return }
                 self!.centerHeartButton.isUserInteractionEnabled = true
              }
    }
    @IBAction func leftBtnClick(_ sender: Any) {
        leftBtn.isUserInteractionEnabled = false
                leftHeartLayer.beginTime = CACurrentMediaTime() - 1
                leftHeartLayer.birthRate = 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                    guard let strongSelf = self else { return }
//                    strongSelf.leftHeartLayer.birthRate = 0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                    guard self != nil else { return }
                    self!.leftBtn.isUserInteractionEnabled = true
                }
    }
    
    @IBAction func rightBtnClick(_ sender: Any) {
        rightBtn.isUserInteractionEnabled = false
              rightHeartLayer.beginTime = CACurrentMediaTime() - 0.2
              rightHeartLayer.birthRate = 1
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
                  guard let strongSelf = self else { return }
                  strongSelf.rightHeartLayer.birthRate = 0
              }
              DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) { [weak self] in
                  guard self != nil else { return }
                self!.rightBtn.isUserInteractionEnabled = true
              }
    }
    @IBAction func gravityBtnClick(_ sender: Any) {
        if gravityLayer.birthRate == 0 {
                    gravityLayer.beginTime = CACurrentMediaTime()
                    gravityLayer.birthRate = 1
                } else {
                    gravityLayer.birthRate = 0
                }
    }
    @IBAction func progresBtnClick(_ sender: Any) {
        if progressLayer.birthRate == 0 {
            progressLayer.beginTime = CACurrentMediaTime()
            progressLayer.birthRate = 1
                } else {
                    progressLayer.birthRate = 0
                }
    }
}
