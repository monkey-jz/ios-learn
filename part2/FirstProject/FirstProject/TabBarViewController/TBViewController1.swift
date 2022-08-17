//
//  TBViewController1.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/9.
//

import UIKit

class TBViewController1: UIViewController {
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.title = "首页"
        self.view.backgroundColor = UIColor.cyan

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBtnClick(_ sender: Any) {
        let alertController = UIAlertController(title: "警告！", message: "请勿向他人透露此消息", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "知道了", style: .default, handler: {
            (data) in print(data)
            
        }))
        alertController.addAction(UIAlertAction(title: "忽略", style: .cancel, handler: {
            (data) in print(data)
            
        }))
        alertController.addAction(UIAlertAction(title: "继续", style: .destructive, handler: {
            (data) in print(data)
            
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func onBtn2Click(_ sender: Any) {
        let alertController = UIAlertController(title: "登陆弹窗", message: "请输入账号密码", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "登陆", style: .default, handler: {(data) in
            print(alertController.textFields?.first?.text ?? "未输入文字")
        }))
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: {(data) in
            print(data)
        }))
        alertController.addTextField(configurationHandler: {(textFiled) in
            textFiled.placeholder = "请输入用户名:"
        })
        alertController.addTextField(configurationHandler: {(textFiled) in
            textFiled.placeholder = "请输入密码:"
            textFiled.isSecureTextEntry = true
        })
        self.present(alertController, animated: true, completion:{() in print("completion")})
    }
    
    
    @IBAction func onBtn3Click(_ sender: Any) {
        let alertController = UIAlertController(title: "底部弹窗", message: "是否要给予权限", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "确定", style: .default, handler: {(data) in
            print(data)
        }))
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: {(data) in
            print(data)
        }))
        self.present(alertController, animated: true, completion: {() in
            print("completion ===")
        })
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
