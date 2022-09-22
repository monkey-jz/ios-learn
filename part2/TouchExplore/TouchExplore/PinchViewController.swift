//
//  PinchViewController.swift
//  TouchExplore
//
//  Created by boyaa on 2022/9/21.
//

import UIKit

class PinchViewController: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var airImage: UIImageView!
    
    private var scale = CGFloat(1)
    private var previousScale = CGFloat(1)
    private var rotation = CGFloat(0)
    private var previousRotation = CGFloat(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        airImage.isUserInteractionEnabled = true
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch(_:)))
        pinchGesture.delegate = self
        airImage.addGestureRecognizer(pinchGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotation(_:)))
        rotationGesture.delegate = self
        airImage.addGestureRecognizer(rotationGesture)
    }
   
    @objc func pinch(_ gesture: UIPinchGestureRecognizer) {
        print("pinch ===")
        scale = gesture.scale
        transformImageView()
        if gesture.state == .ended {
            previousScale = scale * previousScale
            scale = 1
        }
    }
    @objc func rotation(_ gesture: UIRotationGestureRecognizer) {
        print("rotation ===")
        rotation = gesture.rotation
        transformImageView()
        if gesture.state == .ended {
            previousRotation = rotation * previousRotation
            rotation = 0
            
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func transformImageView() {
        var t = CGAffineTransform(scaleX: scale * previousScale, y: scale * previousScale)
        t = t.rotated(by: rotation + previousRotation)
        airImage.transform = t
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
