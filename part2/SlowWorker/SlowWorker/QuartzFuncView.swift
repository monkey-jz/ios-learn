//
//  QuartzFunc.swift
//  SlowWorker
//
//  Created by boyaa on 2022/9/16.
//

import UIKit

class QuartzFuncView: UIView {
    var shape = Shape.line
    var currentColor = UIColor.red
    var useRandomColor = false
    private var firstTouchLocation = CGPoint.zero
    private var lastTouchLocation = CGPoint.zero
    private var redrawRect = CGRect.zero

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(currentColor.cgColor)
        context?.setFillColor(currentColor.cgColor)
      
        switch shape {
        case .line:
            context?.move(to: CGPoint(x: firstTouchLocation.x, y: firstTouchLocation.y))
            context?.addLine(to: CGPoint(x: lastTouchLocation.x, y: lastTouchLocation.y))
            context?.strokePath()
            break
        case .rect:
            context?.addRect(currentRect())
            context?.drawPath(using: .fillStroke)
            break
        case .ellipse:
            context?.addEllipse(in: currentRect())
            context?.drawPath(using: .fillStroke)
            break
        case .image:
            break
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if useRandomColor {
                currentColor = UIColor.randomColor()
            }
            firstTouchLocation = touch.location(in: self)
            lastTouchLocation = firstTouchLocation
            redrawRect = CGRect.zero
            setNeedsDisplay()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastTouchLocation = touch.location(in: self)
            redrawRect = redrawRect.union(currentRect())
            setNeedsDisplay(redrawRect)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastTouchLocation = touch.location(in: self)
            redrawRect = redrawRect.union(currentRect())
            setNeedsDisplay(redrawRect)
        }
    }
    
    func currentRect() -> CGRect {
        return CGRect(x: firstTouchLocation.x, y: firstTouchLocation.y, width: lastTouchLocation.x - firstTouchLocation.x, height: lastTouchLocation.y - firstTouchLocation.y)
    }
   

}

extension UIColor {
    class func randomColor() -> UIColor {
        let red = CGFloat(Double(arc4random_uniform(255)) / 255)
        let green = CGFloat(Double(arc4random_uniform(255)) / 255)
        let blue = CGFloat(Double(arc4random_uniform(255)) / 255)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
enum Shape: Int {
    case line = 0,rect,ellipse,image
}
enum DrawingColor: Int {
    case red = 0,blue,green,random
}
