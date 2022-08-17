//
//  UItableViewDemo3Controller.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/11.
//

import UIKit

class UItableViewDemo3Controller: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    var array: Array<String> = Array()
    var titleArray = ["#","A","B","C","D","E","F","G","H","I"]
    override func viewDidLoad() {
        super.viewDidLoad()
     
        for i in 0...8 {
            self.array.append("联系人:\(i)")
        }
       
        let tableView = UITableView(frame: self.view.frame,style: .grouped)
     
        self.view.addSubview(tableView)
   
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
  func numberOfSections(in tableView: UITableView) -> Int {
        return self.titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        cell.textLabel?.text = self.array[indexPath.row]
        cell.textLabel?.textAlignment = .left
        cell.textLabel?.textColor = UIColor.brown
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.titleArray
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.titleArray[section]
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
       return index
    }
    

  
}
