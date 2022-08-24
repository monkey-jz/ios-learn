//
//  NoteListTableViewController.swift
//  NoteBook
//
//  Created by boyaa on 2022/8/23.
//

import UIKit

class NoteListTableViewController: UITableViewController {
    
    var dataArray = Array<NoteModel>()
    var groupName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = groupName
        setBarButtonItem()
        dataArray = DataManager.getNoteByGroup(group: groupName!)
    }
    
    func setBarButtonItem() {
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddBarButtonClick(btn:)))
        let deleteBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(onDeleteBarButtonClick(btn:)))
        self.navigationItem.rightBarButtonItems = [addBarButtonItem,deleteBarButtonItem]
    }
    
    @objc func onAddBarButtonClick(btn: UIBarButtonItem) {
      
        let noteDetilViewController = NoteDetilViewController()
        noteDetilViewController.group = groupName
        noteDetilViewController.isNew = true
        noteDetilViewController.closure = {(group) in
            self.dataArray = DataManager.getNoteByGroup(group: group)
            self.tableView.reloadData()
        }
        self.navigationController?.pushViewController(noteDetilViewController, animated: true)
    }
    
   
    @objc func onDeleteBarButtonClick(btn: UIBarButtonItem) {
        let alert = UIAlertController(title: "警告", message: "你确定要删除此记事分组么?", preferredStyle: UIAlertController.Style.alert)
        let action2 = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        let action1 = UIAlertAction(title: "删除", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) in
            DataManager.deleteGroup(name: self.groupName!)
            self.navigationController?.popViewController(animated: true)
        })
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true,completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")

        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "reuseIdentifier")
        }
        let model = dataArray[indexPath.row]
        cell?.textLabel?.text = model.title
        cell?.detailTextLabel?.text = model.time
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = dataArray[indexPath.row]
        let noteDetilViewController = NoteDetilViewController()
        noteDetilViewController.noteModel = model
        noteDetilViewController.group = groupName
        noteDetilViewController.isNew = false
        noteDetilViewController.closure = {(group) in
            self.dataArray = DataManager.getNoteByGroup(group: group)
            self.tableView.reloadData()
        }
        self.navigationController?.pushViewController(noteDetilViewController, animated: true)
    }

   
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
