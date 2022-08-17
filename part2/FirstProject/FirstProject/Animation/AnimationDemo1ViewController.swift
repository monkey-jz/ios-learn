//
//  AnimationDemo1ViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/11.
//

import UIKit

class AnimationDemo1ViewController: UIViewController {
    var animationView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = UIView(frame: CGRect(x: 20, y: 100, width: 300, height: 300))
        animationView?.backgroundColor = UIColor.systemPurple
        self.view.addSubview(animationView!)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        UIView.animate(withDuration: 2, animations: {() in
//
//            self.animationView?.backgroundColor = UIColor.cyan
//        }){(finish) in
//            UIView.animate(withDuration: 3, animations: {() in
//
//                self.animationView?.center = CGPoint(x: 300, y: 500)
//            } ){(finish) in
//                UIView.animate(withDuration: 3, animations: {() in
//                        UIView.animateKeyframes(withDuration: 2, delay: 3, options: .autoreverse, animations: {() in
//                        self.animationView?.backgroundColor = UIColor.red
//                    }, completion: {(boolean) in
//                        print("finish: \(boolean)")
//
//                    })
//                } ){(finish) in
//                    UIView.animate(withDuration: 3, delay: 2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.7, options: [.repeat,.autoreverse], animations: {()in
//                        self.animationView?.center = CGPoint(x: 200, y: 100)
//                        self.animationView?.backgroundColor = UIColor.cyan
//                    }, completion: {(boolean) in
//
//                        print(boolean)
//                    })
//
//                }
//
//         }
//      }
//        UIView.transition(with: self.animationView!, duration: 2, options: [.repeat,.autoreverse,.transitionCurlUp], animations: {()in
//            print("=====")
//        }, completion: {(boolean)in
//            print(boolean)
//
//        })
        let view = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        view.backgroundColor = UIColor.brown
        UIView.transition(from: self.animationView!, to: view, duration: 2, options:[.repeat,.autoreverse,.transitionFlipFromRight],completion: {(boolean)in
            print(boolean)
            
        })

    }
    
}
