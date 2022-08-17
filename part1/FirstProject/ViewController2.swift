//
//  ViewController2.swift
//  FirstProject
//
//  Created by jerry on 2022/8/7.
//

import UIKit

class ViewController2: UIViewController,DataPorocol {
 
   override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        let btn = UIButton(frame: CGRect(x: (self.view.frame.width / 2 - 30), y: (self.view.frame.height / 2 - 30), width: 60, height: 40))
        btn.addTarget(self, action: #selector(onBtnClick(btn:)), for: UIControl.Event.touchUpInside)
        btn.setTitle("跳转", for: UIControl.State.normal)
        btn.backgroundColor = UIColor.blue
        self.view.backgroundColor = UIColor.red
        self.view.addSubview(btn)
       
       
    }
    
    @objc
    func onBtnClick(btn: UIButton){
        print("onClick")
        let vc3 = ViewController3(data: "第二种参数传递方式")
        vc3.data = "传递参数"
        vc3.delegate = self
        vc3.closure = {(data: String) -> Void in
            
            print(data)
         }
        self.present(vc3, animated: true, completion: nil)
    
    }
    
    func dataProto(data: String) {
        print("data: \(data)")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    override func didReceiveMemoryWarning() {
        print("didReceiveMemoryWarning")
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
