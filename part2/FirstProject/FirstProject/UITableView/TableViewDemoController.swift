//
//  TableViewDemoController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/10.
//

import UIKit

class TableViewDemoController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var array1: Array<String>?
    var array2: Array<String>?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.array1 = ["a","b","c","d"]
        self.array2 = ["e","f","g"]
        let tableView = UITableView(frame: self.view.frame,style: .grouped)
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt: \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId",for: indexPath)
        
        if indexPath.section ==  0{
            cell.textLabel?.text = self.array1?[indexPath.row]
        }else{
            cell.textLabel?.text = self.array2?[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection:\(section)")
        if section == 0 {
            return self.array1!.count
        }else{
            return self.array2!.count
        }
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt:\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        print("titleForFooterInSection")
        if section == 0{
            return "第一部分的结尾标题"
        }else{
            return "第二部分的结尾标题"
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("titleForHeaderInSection")
        if section == 0{
            return "第一部分的头部标题"
        }else{
            return "第二部分的头部标题"
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var view: UIView
        if section == 0{
            view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 20))
            let lable = UILabel(frame: CGRect(x: 5, y: 0, width: 150, height: 20))
            lable.text = "第一部分尾部标题"
            lable.textColor = UIColor.red
            lable.textAlignment = NSTextAlignment.center
            view.addSubview(lable)
            view.backgroundColor = UIColor.brown
            return view
        }else{
            view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 60))
            view.backgroundColor = UIColor.red
            return view
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view: UIView
        if section == 0{
            view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 20))
            view.backgroundColor = UIColor.cyan
            return view
        }else{
            view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80))
            view.backgroundColor = UIColor.orange
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 30
        }else{
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 20
        }else{
            return 40
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("numberOfSections")
        return 2
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("didDeselectRowAt:\(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        print("didHighlightRowAt:\(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        print("didUnhighlightRowAt:\(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        print("didEndEditingRowAt:\(indexPath!.row)")
    }
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        print("willBeginEditingRowAt:\(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("accessoryButtonTappedForRowWith:\(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        print("didBeginMultipleSelectionInteractionAt:\(indexPath.row)")
    }

 
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        print("willDisplayHeaderView:\(section)")
    }
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        print("willDisplayFooterView:\(section)")
    }
   
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        print("willDisplayHeaddidEndDisplayingHeaderViewerView:\(section)")
    }
    func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        print("didEndDisplayingFooterView:\(section)")
    }
  
  
}
