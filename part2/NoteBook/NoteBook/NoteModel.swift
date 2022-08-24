//
//  NoteModel.swift
//  NoteBook
//
//  Created by boyaa on 2022/8/23.
//

import UIKit

class NoteModel: NSObject {
    var time: String?
    var title: String?
    var group: String?
    var body: String?
    var noteId: Int?
    
    func toDictionary() -> Dictionary<String,Any> {
        var dic: Dictionary<String,Any> = ["time": time!,"title": title!,"group": group!,"body": body!]
        if let id = noteId {
            dic["noteId"] = id
        }
        return dic
        
    }

}
