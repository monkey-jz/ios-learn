//
//  DataManager.swift
//  NoteBook
//
//  Created by boyaa on 2022/8/22.
//

import UIKit
import SQLite

class DataManager: NSObject {
    
    static let TABLE_NAME = "Group"
    static var sqlConnection: Connection?
    static var isOpen: Bool = false
    
    class func saveGroup(groupName: String){
        if !isOpen {
            openDataBase()
        }
        let table = Table(TABLE_NAME)
        let name = Expression<String?>("groupName")
        let insert = table.insert(name <- groupName)
        let _ = try? sqlConnection?.run(insert)
    }
    
    class func getGropData() -> [String] {
        if !isOpen {
            openDataBase()
        }
        var array = Array<String>()
        let table = Table(TABLE_NAME)
        let name = Expression<String?>("groupName")
        for group in try! sqlConnection!.prepare(table) {
            if let n = try? group.get(name) {
                array.append(n)
            }
        }
        return array
    }
    
    class func openDataBase(){
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true).first!
        print("path: \(path)")
        let file = path + "/NoteBook_Group.sqlite"
        
        sqlConnection = try? Connection(file)
        let groupTable = Table(TABLE_NAME)
        let name = Expression<String?>("groupName")
        let id = Expression<Int64>("id")
        let _ = try? sqlConnection?.run(groupTable.create(block: {(table) in
            table.column(id, primaryKey: true)
            table.column(name)
        }))
        isOpen = true
    }

}
