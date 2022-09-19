//
//  DeatilViewController.swift
//  SplitViewControllerDemo
//
//  Created by boyaa on 2022/9/8.
//

import UIKit

class DeatilViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear======")
        register()
    }
    
    func register() {
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(re), name: UIApplication.willEnterForegroundNotification, object: app)
    }
    
    @objc func re(){
        print("re===========")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear======")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear======")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
