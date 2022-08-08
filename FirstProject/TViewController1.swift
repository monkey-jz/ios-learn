//
//  TViewController1.swift
//  FirstProject
//
//  Created by jerry on 2022/8/8.
//

import UIKit

class TViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("TViewController1")
        self.view.backgroundColor = UIColor.cyan
        self.title = "第二个视图控制器"
        let rightBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fastForward, target: self, action: #selector(popVc1))
        self.navigationItem.rightBarButtonItem = rightBtn

        // Do any additional setup after loading the view.
    }
    @objc
    func popVc1(){
        self.navigationController?.popViewController(animated: true)
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
