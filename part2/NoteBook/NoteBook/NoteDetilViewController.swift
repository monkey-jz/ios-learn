//
//  NoteDetilViewController.swift
//  NoteBook
//
//  Created by boyaa on 2022/8/23.
//

import UIKit
import SnapKit

class NoteDetilViewController: UIViewController {
    var noteModel: NoteModel?
    var titleTextFiled: UITextField?
    var contentTextView: UITextView?
    var group: String?
    var isNew: Bool = false
    var closure: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "记事"
        self.edgesForExtendedLayout = UIRectEdge()
        self.view.backgroundColor = UIColor.white
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        setBarButtonItem()
        setUpUI()

    }
    
    func setBarButtonItem() {
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddBarButtonClick(btn:)))
        let deleteBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(onDeleteBarButtonClick(btn:)))
        self.navigationItem.rightBarButtonItems = [addBarButtonItem,deleteBarButtonItem]
    }
    
  
    func setUpUI() {
        titleTextFiled = UITextField()
        self.view.addSubview(titleTextFiled!)
        titleTextFiled?.placeholder = "请输入记事标题"
        titleTextFiled?.borderStyle = .none
        titleTextFiled?.snp.makeConstraints{(maker) in
            maker.left.equalTo(30)
            maker.right.equalTo(-30)
            maker.top.equalTo(30)
            maker.height.equalTo(30)
        }
        
        let lineView = UIView()
        self.view.addSubview(lineView)
        lineView.backgroundColor = UIColor.orange
        lineView.snp.makeConstraints{(maker) in
            maker.left.equalTo(15)
            maker.right.equalTo(-15)
            maker.top.equalTo(titleTextFiled!.snp.bottom).offset(20)
            maker.height.equalTo(3)
            
        }
        
        contentTextView = UITextView()
        self.view.addSubview(contentTextView!)
        contentTextView?.backgroundColor = UIColor.orange
        contentTextView?.snp.makeConstraints{ (maker) in
            maker.left.equalTo(30)
            maker.right.equalTo(-30)
            maker.top.equalTo(lineView.snp.bottom).offset(30)
            maker.bottom.equalTo(-30)
            
        }
        if !isNew && self.noteModel != nil{
            titleTextFiled?.text = noteModel?.title
            contentTextView?.text = noteModel?.body
        }
             
    }
    
    @objc func onAddBarButtonClick(btn: UIBarButtonItem) {
        if isNew {
            if titleTextFiled?.text != nil && titleTextFiled!.text!.count > 0 {
                noteModel = NoteModel()
                noteModel?.group = group
                noteModel?.body = contentTextView?.text
                noteModel?.title = titleTextFiled?.text
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
                noteModel?.time = dateFormater.string(from: Date())
                DataManager.addNote(noteModel: noteModel!)
                if closure != nil{
                    closure!(group!)
                }
                self.navigationController?.popViewController(animated: true)
            }
       
        }else{
            if titleTextFiled?.text != nil && titleTextFiled!.text!.count > 0 {
               noteModel?.body = contentTextView?.text
                noteModel?.title = titleTextFiled?.text
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
                noteModel?.time = dateFormater.string(from: Date())
                DataManager.updateNote(noteModel: noteModel!)
                if closure != nil{
                    closure!(group!)
                }
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @objc func onDeleteBarButtonClick(btn: UIBarButtonItem) {
        let alert = UIAlertController(title: "警告", message: "你确定要删除此条记事么?", preferredStyle: UIAlertController.Style.alert)
        let action2 = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        let action1 = UIAlertAction(title: "删除", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) in
            DataManager.deleteNote(noteModel: self.noteModel!)
            if self.closure != nil{
                self.closure!(self.group!)
            }
            self.navigationController?.popViewController(animated: true)
        })
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true,completion: nil)
       
    }
    
    @objc func keyboardWillBeShow(notification: Notification) {
        
    }
    
    @objc func keyboardWillBeHide(notification: Notification) {
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }



}
