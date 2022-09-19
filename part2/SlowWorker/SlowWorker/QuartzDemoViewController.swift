//
//  QuartzDemoViewController.swift
//  SlowWorker
//
//  Created by boyaa on 2022/9/16.
//

import UIKit

class QuartzDemoViewController: UIViewController {
    
    @IBOutlet weak var colorControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        let drawingColorSelect = DrawingColor(rawValue: sender.selectedSegmentIndex)
        if let drawingColor = drawingColorSelect {
            let funView = self.view as! QuartzFuncView
            switch drawingColor {
            case .blue:
                funView.currentColor = UIColor.blue
                funView.useRandomColor = false
            case .green:
                funView.currentColor = UIColor.green
                funView.useRandomColor = false
            case .red:
                funView.currentColor = UIColor.red
                funView.useRandomColor = false
            case .random:
                funView.useRandomColor = true
            }
        }
        
    }
    
    @IBAction func shapeChange(_ sender: UISegmentedControl) {
        let drawingShapeSelect = Shape(rawValue: sender.selectedSegmentIndex)
        if let drawingShape = drawingShapeSelect {
            let funView = self.view as! QuartzFuncView
            funView.shape = drawingShape
        }
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
