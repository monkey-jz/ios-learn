//
//  TouchDemoViewcontroller.swift
//  TouchExplore
//
//  Created by boyaa on 2022/9/21.
//

import UIKit

class TouchDemoViewcontroller: UIViewController {
    @IBOutlet weak var singleLabel: UILabel!
    @IBOutlet weak var doubleLabel: UILabel!
    @IBOutlet weak var tripleLabel: UILabel!
    @IBOutlet weak var quadrupleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(TouchDemoViewcontroller.singleTap))
        singleTap.numberOfTouchesRequired = 1
        singleTap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(singleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(TouchDemoViewcontroller.doubleTap))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(doubleTap)
        singleTap.require(toFail: doubleTap)
        
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(TouchDemoViewcontroller.tripleTap))
        tripleTap.numberOfTapsRequired = 3
        tripleTap.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(tripleTap)
        doubleTap.require(toFail: tripleTap)
        
        let quadrupleTap = UITapGestureRecognizer(target: self, action: #selector(TouchDemoViewcontroller.quadrupleTap))
        quadrupleTap.numberOfTapsRequired = 4
        quadrupleTap.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(quadrupleTap)
        tripleTap.require(toFail: quadrupleTap)
    }
    
    @objc func singleTap() {
        showText(text: "singleTap", label: singleLabel)
    }
    
    @objc func doubleTap() {
        showText(text: "doubleTap", label: doubleLabel)
    }
    
    @objc func tripleTap() {
        showText(text: "tripleTap", label: tripleLabel)
    }
    
    @objc func quadrupleTap() {
        showText(text: "quadrupleTap", label: quadrupleLabel)
    }
    
    private func showText(text: String,label: UILabel) {
        label.text = text
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            label.text = ""
        })
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
