//
//  DataManager.swift
//  NoteBook
//
//  Created by boyaa on 2022/8/22.
//

import UIKit
import SQLite

class DataManager: NSObject {
    
    static let GROUP_TABLE_NAME = "Group"
    static let NOTE_TABLE_NAME = "Note"
    static var sqlConnection: Connection?
    static var isOpen: Bool = false
    
    class func saveGroup(groupName: String){
        if !isOpen {
            openDataBase()
        }
        let table = Table(GROUP_TABLE_NAME)
        let name = Expression<String?>("groupName")
        let insert = table.insert(name <- groupName)
        let _ = try? sqlConnection?.run(insert)
    }
    
    class func getGropData() -> [String] {
        if !isOpen {
            openDataBase()
        }
        var array = Array<String>()
        let table = Table(GROUP_TABLE_NAME)
        let name = Expression<String?>("groupName")
        for group in try! sqlConnection!.prepare(table) {
            if let n = try? group.get(name) {
                array.append(n)
            }
        }
        return array
    }
    
    class func getNoteByGroup(group: String) -> [NoteModel] {
        if !isOpen {
            openDataBase()
        }
        var array = Array<NoteModel>()
        let table = Table(NOTE_TABLE_NAME)
        let ownGroup = Expression<String?>("ownGroup")
        let time = Expression<String?>("time")
        let body = Expression<String?>("body")
        let title = Expression<String?>("title")
        let id = Expression<Int64>("id")
        for note in try! sqlConnection!.prepare(table.filter(ownGroup.like(group))) {
            let noteMode = NoteModel()
            if let g = try? note.get(ownGroup) {
                noteMode.group = g
            }
            if let t = try? note.get(time) {
                noteMode.time = t
            }
            if let ti = try? note.get(title) {
                noteMode.title = ti
            }
            if let b = try? note.get(body) {
                noteMode.body = b
            }
            if let i = try? note.get(id) {
                noteMode.noteId = Int(i)
            }
            array.append(noteMode)
        }
        return array
    }
    
    class func addNote(noteModel: NoteModel){
        if !isOpen {
            openDataBase()
        }
        let table = Table(NOTE_TABLE_NAME)
        let groupName = Expression<String?>("ownGroup")
        let time = Expression<String?>("time")
        let body = Expression<String?>("body")
        let title = Expression<String?>("title")
        let insert = table.insert(groupName <- noteModel.group,time <- noteModel.time,title <- noteModel.title,body <- noteModel.body)
        let _ = try? sqlConnection?.run(insert)
        
    }
    
    class func openDataBase(){
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true).first!
        print("path: \(path)")
        let file = path + "/NoteBook_Group.sqlite"
        
        sqlConnection = try? Connection(file)
        let groupTable = Table(GROUP_TABLE_NAME)
        let name = Expression<String?>("groupName")
        let id = Expression<Int64>("id")
        let _ = try? sqlConnection?.run(groupTable.create(block: {(table) in
            table.column(id, primaryKey: true)
            table.column(name)
        }))
        
        let note = Table(NOTE_TABLE_NAME)
        let group = Expression<String?>("ownGroup")
        let time = Expression<String?>("time")
        let title = Expression<String?>("title")
        let body = Expression<String?>("body")
        let noteId = Expression<Int64>("id")
        let _ = try? sqlConnection?.run(note.create(block: {(table) in
            table.column(noteId, primaryKey: true)
            table.column(group)
            table.column(time)
            table.column(title)
            table.column(body)
        }))
        isOpen = true
    }
    
    class func updateNote(noteModel: NoteModel) {
        if !isOpen {
            openDataBase()
        }
        let noteTable = Table(NOTE_TABLE_NAME)
        let id = Expression<Int64>("id")
        
        let target = noteTable.filter(id == Int64(noteModel.noteId!))
        
        let group = Expression<String?>("ownGroup")
        let time = Expression<String?>("time")
        let title = Expression<String?>("title")
        let body = Expression<String?>("body")
        let _ = try? sqlConnection?.run(target.update(group <- noteModel.group,time <- noteModel.time,title <- noteModel.title,body <- noteModel.body))
  
    }
    
    class func deleteNote(noteModel: NoteModel){
        if !isOpen {
            openDataBase()
        }
        let noteTable = Table(NOTE_TABLE_NAME)
        let id = Expression<Int64>("id")
        
        let target = noteTable.filter(id == Int64(noteModel.noteId!))
        
        let _ = try? sqlConnection?.run(target.delete())
    
    }
    
    class func deleteGroup(name: String) {
        if !isOpen {
            openDataBase()
        }
        let noteTable = Table(NOTE_TABLE_NAME)
        let ownGroup = Expression<String>("ownGroup")
        let targetNote = noteTable.filter(ownGroup.like(name))
        let _ = try? sqlConnection?.run(targetNote.delete())
       
        let groupTable = Table(GROUP_TABLE_NAME)
        let groupName = Expression<String>("groupName")
        let targetGroup = groupTable.filter(groupName.like(name))
        let _ = try? sqlConnection?.run(targetGroup.delete())
    }

}
