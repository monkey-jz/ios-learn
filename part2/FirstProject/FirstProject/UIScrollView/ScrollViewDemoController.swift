//
//  ScrollViewDemoController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/10.
//

import UIKit

class ScrollViewDemoController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let SCREEN_WIDTH = self.view.frame.size.width
        let SCREEN_HEIGHT = self.view.frame.size.height
        let scrollView = UIScrollView(frame: self.view.frame)
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(SCREEN_WIDTH), height:  CGFloat(SCREEN_HEIGHT)))
        view1.backgroundColor = UIColor.brown
        let view2 = UIView(frame: CGRect(x: CGFloat(SCREEN_WIDTH), y: 0, width: CGFloat(SCREEN_WIDTH), height: CGFloat(SCREEN_HEIGHT)))
        view2.backgroundColor = UIColor.cyan
        scrollView.addSubview(view1)
        scrollView.addSubview(view2)
        scrollView.contentSize = CGSize(width: CGFloat(SCREEN_WIDTH * 1.5), height: CGFloat(SCREEN_HEIGHT))
        self.view.addSubview(scrollView)
        scrollView.delegate = self

     
    }
   

   

}
