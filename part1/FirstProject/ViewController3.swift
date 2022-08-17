//
//  ViewController3.swift
//  FirstProject
//
//  Created by jerry on 2022/8/8.
//

import UIKit

protocol DataPorocol{
    func dataProto(data: String)
}

class ViewController3: UIViewController {
    var closure: ((String) -> Void)?
    var data: String?
    var sData: String?
    var delegate: DataPorocol?
    init(data: String) {
        
        self.sData = data
        print("sData: \(sData)")
        super.init(nibName: nil, bundle: nil)
    }
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        print("ViewController3: viewDidLoad")
        print(data!)
        self.view.backgroundColor = UIColor.purple
        
        let btn = UIButton(frame: CGRect(x: (self.view.frame.width / 2 - 30), y: (self.view.frame.height / 2 - 30), width: 60, height: 40))
        
        btn.addTarget(self, action: #selector(onBtnClick(btn:)), for: UIControl.Event.touchUpInside)
        btn.setTitle("跳转", for: UIControl.State.normal)
        btn.backgroundColor = UIColor.blue
        self.view.backgroundColor = UIColor.orange
        self.view.addSubview(btn)

        // Do any additional setup after loading the view.
    }
    @objc
    func onBtnClick(btn: UIButton){
        self.closure!("回调参数")
        self.delegate?.dataProto(data: "第二种回调方式,协议")
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews3")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews3")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear3")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear3")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear3")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear3")
    }
    override func didReceiveMemoryWarning() {
        print("didReceiveMemoryWarning3")
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
