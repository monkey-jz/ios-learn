//
//  ViewController.swift
//  TouchExplore
//
//  Created by boyaa on 2022/9/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tapsLabel: UILabel!
    @IBOutlet weak var touchesLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var swipe: UILabel!
    
    private var startPoint: CGPoint!
    private static let minimumGestureLength = Float(25.0)
    private static let maximumVariance = Float(5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for touchCount in 1..<5 {
            
            let v = UISwipeGestureRecognizer(target: self, action: #selector(reportVSwipe(_:)))
            v.direction = [.up,.down]
            v.numberOfTouchesRequired = touchCount
            self.view.addGestureRecognizer(v)
            let h = UISwipeGestureRecognizer(target: self, action: #selector(reportHSwipe(_:)))
            h.direction = [.left,.right]
            h.numberOfTouchesRequired = touchCount
            self.view.addGestureRecognizer(h)
        }
       
    }
    
    private func updateLabelsFromTouches(_ touch: UITouch?,allTouches: Set<UITouch>?) {
        let numTaps = touch?.tapCount ?? 0
        let tapsMessage = "\(numTaps) taps detected"
        tapsLabel.text = tapsMessage
        
        let numTouches = allTouches?.count ?? 0
        let touchMsg = "\(numTouches) touches detected"
        touchesLabel.text = touchMsg
        
        if traitCollection.forceTouchCapability == .available {
            forceLabel.text = "Force: \(touch?.force ?? 0) \nMax force: \(touch?.maximumPossibleForce ?? 0 )"
        }else {
            forceLabel.text = "3D Touch not available"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageLabel.text = "touchesBegan"
        updateLabelsFromTouches(touches.first,allTouches: touches)
        
        if let touch = touches.first {
            startPoint = touch.location(in: self.view)
        }
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageLabel.text = "touchesCancelled"
        updateLabelsFromTouches(touches.first,allTouches: touches)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageLabel.text = "touchesMoved"
        updateLabelsFromTouches(touches.first,allTouches: touches)
        if let touch = touches.first,let startPoint = self.startPoint {
//            let currentPoint = touch.location(in: self.view)
//            let diffX = fabsf(Float(startPoint.x - currentPoint.x))
//            let diffY = fabsf(Float(startPoint.y - currentPoint.y))
//            if diffX >= ViewController.minimumGestureLength && diffY <= ViewController.maximumVariance{
//                self.swipe.text = "横向扫过"
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
//                    self.swipe.text = ""
//                })
//            }else if diffY > ViewController.minimumGestureLength && diffX <= ViewController.maximumVariance{
//                self.swipe.text = "竖向扫过"
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
//                    self.swipe.text = ""
//                })
//            }
        }
        
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("motionBegan =============")
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("motionEnded =============")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageLabel.text = "touchesEnded"
        updateLabelsFromTouches(touches.first,allTouches: touches)
    }
    
    @objc
    private func reportVSwipe(_ recongniser: UIGestureRecognizer) {
        print("reportVSwipe====")
        let count = desForTouchCount(recongniser.numberOfTouches)
        self.swipe.text = "\(count) 竖向扫过"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.swipe.text = ""
        })
    }
    
    @objc
    private func reportHSwipe(_ recongniser: UIGestureRecognizer) {
        print("reportHSwipe====")
        let count = desForTouchCount(recongniser.numberOfTouches)
        self.swipe.text = "\(count) 横向扫过"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.swipe.text = ""
        })
    }
    
    private func desForTouchCount(_ touchCount: Int) -> String {
        switch touchCount {
        case 1:
            return "Single"
        case 2:
            return "Double"
        case 3:
            return "Triple"
        case 4:
            return "Quadruple"
        case 5:
            return "Quintuple"
        default:
            return ""
        }
    }


}

