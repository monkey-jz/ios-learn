//
//  LayerDemo1ViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/12.
//

import UIKit

class LayerDemo1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        CAGradientLayerTest()
        ReplicatorLayerTest()
        musicAnimation()
        dotLoading()
//        roatation()
        shapeLayer()
  }
    
    func CAGradientLayerTest() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        gradientLayer.position = CGPoint(x: 100, y: 100)
        gradientLayer.colors = [UIColor.red.cgColor,UIColor.green.cgColor,UIColor.blue.cgColor]
        gradientLayer.locations = [NSNumber(value: 0.2),NSNumber(value: 0.5),NSNumber(value: 0.7)]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.addSublayer(gradientLayer)
    }
    
    func ReplicatorLayerTest(){
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.position = CGPoint.zero
        let sublayer = CALayer()
        sublayer.position = CGPoint(x: 30, y: 200)
        sublayer.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        sublayer.backgroundColor = UIColor.purple.cgColor
        replicatorLayer.addSublayer(sublayer)
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(50, 0, 0)
        replicatorLayer.instanceCount = 6
        // 设置颜色
        let offsetStep = -1 / Float(6)
        replicatorLayer.instanceBlueOffset = offsetStep
        replicatorLayer.instanceGreenOffset = offsetStep
        self.view.layer.addSublayer(replicatorLayer)
      
    }
    func musicAnimation() {
        // 创建replicatorLayer
        let replicatorLayer = CAReplicatorLayer()
        let height: CGFloat = 100
        replicatorLayer.frame = CGRect(x: 20, y: 300, width: 300, height: 100)
        replicatorLayer.backgroundColor = UIColor.gray.cgColor
        view.layer.addSublayer(replicatorLayer)

        // 创建音量条
        let volumeLayer = CALayer()
        volumeLayer.backgroundColor = UIColor.cyan.cgColor
        let volumeWidth: CGFloat = 30
        volumeLayer.bounds = CGRect(x: 0, y: 0, width: volumeWidth, height: 100);
        volumeLayer.anchorPoint = CGPoint(x: 0, y: 1)
        volumeLayer.position = CGPoint(x: 0, y: height)
        view.layer.addSublayer(volumeLayer)

        // 对音量条添加动画
        let animation = CABasicAnimation(keyPath: "transform.scale.y")
        animation.toValue = 0
        animation.duration = 1.0
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        volumeLayer.add(animation, forKey: nil)

        replicatorLayer.addSublayer(volumeLayer)

        // 设置音量条个数
        replicatorLayer.instanceCount = 6
        // 设置延时
        replicatorLayer.instanceDelay = 0.35
        // 设置透明度递减
        replicatorLayer.instanceAlphaOffset = -0.15
        // 对每个音量震动条移动40
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(volumeWidth + 10, 0, 0)
    }

    func dotLoading() {
         let replicatorLayer = CAReplicatorLayer()
         replicatorLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
         replicatorLayer.position = view.center
         view.layer.addSublayer(replicatorLayer)

         // 添加小圆点
         let dotLayer = CALayer()
         dotLayer.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
         dotLayer.position = CGPoint(x: 30, y: 30)
         dotLayer.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.6).cgColor
         dotLayer.cornerRadius = 5;
        
         dotLayer.masksToBounds = true
         replicatorLayer.addSublayer(dotLayer)

         // 添加缩放动画
         let animation = CABasicAnimation(keyPath: "transform.scale")
         animation.duration = 1
         animation.fromValue = 1
         animation.toValue = 0.1
         animation.repeatCount = Float.infinity
         dotLayer.add(animation, forKey: nil)

         // 设置个数
         let count = 12
         replicatorLayer.instanceCount = count
         // 每次旋转的角度等于 2π / 12
         replicatorLayer.instanceTransform = CATransform3DMakeRotation((2 * CGFloat.pi) / CGFloat(count) , 0, 0, 1)
         // 添加延迟
         replicatorLayer.instanceDelay = CFTimeInterval(1.0 / CGFloat(count))

         // 解决最开始旋转衔接效果
         dotLayer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
     }
    
    func roatation(){
        // 创建replicatorLayer
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        //注意:是包括自己在内总共为2个对象
        replicatorLayer.instanceCount = 2

        // 创建transform
        var transform = CATransform3DIdentity
        let verticalOffset: CGFloat = replicatorLayer.bounds.height
        // 沿y轴移动verticalOffset高度
        transform = CATransform3DTranslate(transform, 0, verticalOffset + 2, 0)
        // 沿着z轴旋转180度
        transform = CATransform3DRotate(transform, CGFloat.pi, 0, 0, 1)
        // 使用transform
        replicatorLayer.instanceTransform = transform
        replicatorLayer.instanceAlphaOffset = -0.6

        // 添加子layer
        let subLayer = CALayer()
        subLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        subLayer.contents = UIImage(named: "product1")?.cgImage
        replicatorLayer.addSublayer(subLayer)
    }
    
    func shapeLayer(){
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 20, y: 410, width: 300, height: 300)
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 10, y: 20))
        path.addLine(to: CGPoint(x: 90, y: 100))
        path.addLine(to: CGPoint(x: 50, y: 230))
        path.addLine(to: CGPoint(x: 10, y: 20))
        layer.path = path
        layer.strokeStart = 0
        layer.strokeEnd = 1
        layer.fillColor = UIColor.cyan.cgColor
        layer.strokeColor = UIColor.orange.cgColor
        layer.fillRule = CAShapeLayerFillRule.evenOdd
        layer.lineWidth = 2
        self.view.layer.addSublayer(layer)
    }
}
