//
//  AutoLayoutViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/15.
//

import UIKit

class AutoLayoutViewController: UIViewController,UIScrollViewDelegate {
 
    @IBOutlet weak var progressView: NSLayoutConstraint!
    

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
     
        var scrollProgress = scrollView.contentOffset.x / scrollView.frame.width
        scrollProgress = scrollProgress > 1 ? 1 : scrollProgress
        scrollProgress = scrollProgress < 0 ? 0 : scrollProgress
        progressView.constant = scrollView.frame.width / 2 * scrollProgress
        self.view.layoutIfNeeded()

    }
    


}
