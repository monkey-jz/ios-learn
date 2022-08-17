//
//  TBViewController4.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/9.
//

import UIKit

class TBViewController4: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "个人中心"
        self.tabBarItem.badgeColor = UIColor.red
        self.tabBarItem.badgeValue = "新消息\(5)"
        self.tabBarController?.customizableViewControllers = nil
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.view.backgroundColor = UIColor.darkGray
        

        // Do any additional setup after loading the view.
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
