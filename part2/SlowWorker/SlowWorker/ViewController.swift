//
//  ViewController.swift
//  SlowWorker
//
//  Created by boyaa on 2022/9/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var statrtBtn: UIButton!
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    var loggerClosure = {() -> Bool in
        
        return true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.spinner.isHidden = true
    }
    
    func fetchSomthingFromServer() -> String{
        Thread.sleep(forTimeInterval: 1)
        return "Hi there"
    }
    func processData(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 2)
        return data.uppercased()
    }
    func calculateResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 3)
        return "Number of chars : \(data.count)"
    }
    func calculateSecondResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 4)
        return data.replacingOccurrences(of: "E", with: "e")
    }
    
    @IBAction func doWork(_ sender: AnyObject) {
        let startTime = NSDate()
        self.resultTextView.text = ""
        let queue = DispatchQueue.global(qos: .default)
        self.spinner.isHidden = false
        self.statrtBtn.isEnabled = false
        self.spinner.startAnimating()
        //在子线程
        queue.async {
            let fetchedData = self.fetchSomthingFromServer()
            let processData = self.processData(fetchedData)
            var firstResult: String!
            var secondResult: String!
            
            let group = DispatchGroup()
            queue.async(group: group) {
                firstResult = self.calculateResult(processData)
            }
            queue.async(group: group) {
                secondResult = self.calculateSecondResult(processData)
            }
            group.notify(queue: queue) {
                let resultsSummary = "First: [\(firstResult)\nSecond:\(secondResult)]"
                //在主线程修改view
                DispatchQueue.main.async {
                    self.resultTextView.text = resultsSummary
                    self.statrtBtn.isEnabled = true
                    self.spinner.stopAnimating()
                    self.spinner.isHidden = true
                }
               
                let endTime = NSDate()
                print("Complete in \(endTime.timeIntervalSince(startTime as Date)) Seconds")
            }
          
           
        }
      
    }


}

