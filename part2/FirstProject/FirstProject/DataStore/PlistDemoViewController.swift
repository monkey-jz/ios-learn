//
//  PlistDemoViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/9/14.
//

import UIKit

class PlistDemoViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var textFileds: [UITextField]!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = dataFileUrl()
        if FileManager.default.fileExists(atPath: url.path!){
            if let array =  NSArray(contentsOf: url as URL) as? [String] {
                for i in 0..<array.count {
                    textFileds[i].text = array[i]
                }
            }
        }
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(appWillResignActive(notification:)), name: UIApplication.willResignActiveNotification, object:app)

       
    }
    
    @objc func appWillResignActive(notification: Notification) {
        print("appWillResignActive ====")
        let url = dataFileUrl()
        let array = (textFileds as NSArray).value(forKey: "text") as! NSArray
        array.write(to: url as URL, atomically: true)
        
    }
    
    func dataFileUrl() -> NSURL{
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var url: NSURL?
        url = NSURL(fileURLWithPath: "")
        do {
            try url = urls.first!.appendingPathComponent("data.plist") as NSURL
        } catch  {
            print("error: \(error)")
        }
        return url!
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        true
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
