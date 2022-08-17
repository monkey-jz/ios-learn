//
//  AutoLayoutDemo3ViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/16.
//

import UIKit

class AutoLayoutDemo3ViewController: UIViewController ,UITextViewDelegate{
    var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.cyan.cgColor
        textView.delegate = self
        self.view.addSubview(textView)
        textView.snp.makeConstraints({(make) in
            make.centerX.equalTo(self.view.center.x)
            make.centerY.equalTo(self.view.center.y)
            make.width.equalTo(60)
            make.height.equalTo(30)
        })
    
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
       
        if textView.contentSize.height != textView.bounds.size.height && textView.contentSize.height < 60  {
            textView.snp.updateConstraints({(make) in
                make.height.equalTo(textView.contentSize.height)
                
            })
            UIView.animate(withDuration: 0.3, animations: {() in
                self.view.layoutIfNeeded()
            })
        }
        return true
    }
    


}
