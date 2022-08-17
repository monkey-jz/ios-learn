//
//  TBViewController2.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/9.
//

import UIKit

class TBViewController2: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "推荐"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBarItem.image = UIImage(named: <#T##String#>)
        //self.tabBarItem.selectedImage = UIImage(named: <#T##String#>)
        self.view.backgroundColor = UIColor.brown
        let barItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 1)
        self.tabBarItem = barItem
        
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
