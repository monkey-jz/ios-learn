//
//  TableViewDemo2ViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/10.
//

import UIKit

class TableViewDemo2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var array: Array<Product>?
override func viewDidLoad() {
        super.viewDidLoad()
        let p1 = Product()
        p1.desc = "这是测试描述文字1"
        p1.name = "产品名称1"
        p1.price = 663
        p1.imageName = "product1"
        let p2 = Product()
        p2.desc = "这是测试描述文字"
        p2.name = "产品名称2"
        p2.price = 664
        p2.imageName = "product1"
        self.array = [p1,p2]
       
        let tableView = UITableView(frame: self.view.frame,style: .grouped)
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCellId")
        self.view.addSubview(tableView)
        tableView.isEditing = true
        tableView.delegate = self
        tableView.dataSource = self
    }
  
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row == 0 {
            return UITableViewCell.EditingStyle.insert
        }else{
            return UITableViewCell.EditingStyle.delete
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        if indexPath.row == 0 {
            return "插入"
        }else{
            return "删除"
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.insert {
            print("点击了插入按钮")
            let p3 = Product()
            p3.desc = "这是测试描述文字"
            p3.name = "产品名称3"
            p3.price = 664
            p3.imageName = "product1"
            self.array?.insert(p3, at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .left)
            
        }else{
            print("点击了删除按钮")
            self.array?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = self.array![sourceIndexPath.row]
        self.array![destinationIndexPath.row] = temp
        self.array![sourceIndexPath.row] = self.array![destinationIndexPath.row]
        
    }
    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId",for: indexPath) as! ProductTableViewCell
        let model = self.array![indexPath.row]
        cell.desc.text = model.desc
        cell.imageName.image = UIImage(named: model.imageName!)
        cell.name.text = model.name
        cell.price.text = String(model.price!)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    


}
