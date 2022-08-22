//
//  ViewController.swift
//  NoteBook
//
//  Created by boyaa on 2022/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    var dataArray: Array<String>?
    var homeView: HomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "点滴生活"
        self.edgesForExtendedLayout = UIRectEdge()
        self.dataArray = DataManager.getGropData()
        self.setAddBtn()
        self.setHomeView()
        
    }
    
    func setHomeView(){
        self.homeView = HomeView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 60))
        self.view.addSubview(self.homeView)
        updateHomeViewData()
    }
    
    func updateHomeViewData(){
        self.homeView.dataArray = self.dataArray
        self.homeView.updateLayout()
    }
    
    func setAddBtn(){
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightBarBtnClick(btn:)))
        self.navigationItem.rightBarButtonItem = rightBarItem
        
    }
    
    @objc func rightBarBtnClick(btn: UIBarButtonItem) {
        showAlert()
    }
    func showAlert(){
        
        let alert = UIAlertController(title: "添加记事分组", message: "新添加的分组不能与已有的分组相同", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(configurationHandler: {(textFiled) in
            textFiled.placeholder = "请输入分组名称"
        })
        let action1 = UIAlertAction(title: "取消", style: .cancel, handler: {(UIAlertAction) in
            return
        })
        let action2 = UIAlertAction(title: "确定", style: .destructive , handler:{(UIAlertAction) in
            let text = alert.textFields?.first?.text
            if text?.count != 0{
                if !self.dataArray!.contains(text!) {
                    self.dataArray?.append(text!)
                    self.updateHomeViewData()
                    DataManager.saveGroup(groupName: text!)
                }
            }
        
       } )
     
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: {() in
            
            print("alert finish ====")
        })
    }
    


}

