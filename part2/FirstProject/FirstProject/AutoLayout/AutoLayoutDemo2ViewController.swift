//
//  AutoLayoutDemo2ViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/16.
//

import UIKit

class AutoLayoutDemo2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView()
        view1.backgroundColor = UIColor.orange
        view1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view1)
        let layoutConstraint1 = NSLayoutConstraint(item: view1, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let layoutConstraint2 = NSLayoutConstraint(item: view1, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        let layoutConstraint3 = NSLayoutConstraint(item: view1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        let layoutConstraint4 = NSLayoutConstraint(item: view1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        self.view.addConstraints([layoutConstraint1,layoutConstraint2,layoutConstraint3,layoutConstraint4])
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.purple
        view2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view2)
        let stringH = "H:|-100-[view2]-100-|"
        let stringV = "V:|-50-[view2(100)]"
        
        let layoutConstraintH = NSLayoutConstraint.constraints(withVisualFormat: stringH, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views:  ["view2":view2])
        let layoutConstraintV = NSLayoutConstraint.constraints(withVisualFormat: stringV, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views:  ["view2":view2])
        self.view.addConstraints(layoutConstraintH)
        self.view.addConstraints(layoutConstraintV)
        
        let view3 = UIView()
        view3.backgroundColor = UIColor.yellow
        self.view.addSubview(view3)
        view3.snp.makeConstraints({(make) in
            make.left.equalTo(90)
            make.right.equalTo(-90)
            make.top.equalTo(160)
            make.bottom.equalTo(-600)
            
        })
     
        
    }
    
  
  

}
