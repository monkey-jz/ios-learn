//
//  InternetDemoViewController.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/16.
//

import UIKit

class InternetDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUserDefault()
        getUserDefault()
        readAndWritePList()
        archive1()
        peopleArchive()
        
        //调用Objective-C文件中的类执行sql语句
        ObjectC_Handler.runNormalSql("create table Student(name text PRIMARY KEY,age integer DEFAULT 15)")
        ObjectC_Handler.runNormalSql("insert into Student(name,age) values(\"珲少\",25)")
        ObjectC_Handler.selectSql()

    }
    
    func httpRequest(){
        let config = URLSessionConfiguration.default
        let url = URL(string: "https://www.baidu.com/")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request, completionHandler: {(data,response,error) in
            print(data!)
            print(response)
            print(error)
            
        })
        task.resume()
    }
    
    func setUserDefault(){
        var userDefault = UserDefaults.standard
        userDefault.set(URL(string: "https://www.baidu.com/"), forKey: "baiduurl")
        userDefault.set("stringValue", forKey: "String类型")
        userDefault.set(true, forKey: "Boolean")
        userDefault.set(Float(2),forKey: "Float")
        userDefault.set(Double(3), forKey: "Double")
        userDefault.set(1, forKey: "Int")
        userDefault.set(["dic":1], forKey: "Dic")
        userDefault.set([1,2,3], forKey: "Array")
        userDefault.set(Data(), forKey: "Data")
        userDefault.synchronize()
    }
    
    func getUserDefault(){
        let userDefault = UserDefaults.standard
      
        print(userDefault.array(forKey: "Array"))
        print(userDefault.dictionary(forKey: "Dic"))
        print(userDefault.integer(forKey: "Int"))
        print(userDefault.double(forKey: "Double"))
        print(userDefault.float(forKey: "Float"))
        print(userDefault.data(forKey: "Data"))
        print(userDefault.bool(forKey: "Boolean"))
        print(userDefault.string(forKey: "String类型"))
        print(userDefault.url(forKey: "baiduurl"))
    }
    
    func readAndWritePList(){
        let plist = Bundle.main.path(forResource: "NewPList", ofType: "plist")
        let dic = NSDictionary(contentsOfFile: plist!)
        print(dic ?? "dic is nil !")
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let path2 = NSSearchPathForDirectoriesInDomains(.allApplicationsDirectory, .userDomainMask, true).first
        let path3 = NSSearchPathForDirectoriesInDomains(.allLibrariesDirectory, .userDomainMask, true).first
        let path4 = NSSearchPathForDirectoriesInDomains(.adminApplicationDirectory, .userDomainMask, true).first
        let path5 = NSSearchPathForDirectoriesInDomains(.developerDirectory, .userDomainMask, true).first
        let path6 = NSSearchPathForDirectoriesInDomains(.applicationDirectory, .userDomainMask, true).first
        let path7 = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first
        let path8 = NSSearchPathForDirectoriesInDomains(.autosavedInformationDirectory, .userDomainMask, true).first
        let path9 = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
        let path10 = NSSearchPathForDirectoriesInDomains(.coreServiceDirectory, .userDomainMask, true).first
        let path11 = NSSearchPathForDirectoriesInDomains(.demoApplicationDirectory, .userDomainMask, true).first
        let path12 = NSSearchPathForDirectoriesInDomains(.downloadsDirectory, .userDomainMask, true).first
        let path13 = NSSearchPathForDirectoriesInDomains(.musicDirectory, .userDomainMask, true).first
        print(path)
        print(path2)
        print(path3)
        print(path4)
        print(path5)
        print(path6)
        print(path7)
        print(path8)
        print(path9)
        print(path10)
        print(path11)
        print(path12)
        print(path13)
        let file = path! + "/NewPList.plist"
        let newDic: NSDictionary = ["key2": 123,"key3" : true]
        newDic.write(toFile: file, atomically: true)
        let dic2 = NSDictionary(contentsOfFile: file)
        print(dic2 ?? "dic is nil !")
        
    }
    
    func archive1() {
        let homeDirectory = NSHomeDirectory()
        let filePath = homeDirectory + "archiver.file"
        NSKeyedArchiver.archiveRootObject("test1", toFile: filePath)
        let value = NSKeyedUnarchiver.unarchiveObject(withFile: filePath)
        print(value)
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(29, forKey: "age")
        archiver.encode("test2", forKey: "name")
        archiver.finishEncoding()
        data.write(toFile: filePath, atomically: true)
        
        let dataPath = try? Data(contentsOf: URL(fileURLWithPath: filePath))
        let unarchiver: NSKeyedUnarchiver
        do {
            try unarchiver =  NSKeyedUnarchiver(forReadingFrom: dataPath!)
            let age = unarchiver.decodeInt32(forKey: "age")
            let name = unarchiver.decodeObject(forKey: "name")
            print("name: \(name),age: \(age)")
        } catch  {
            
        }
   }
    
    func peopleArchive(){
        let p1 = People(name: "test3", age: 20)
        print(p1)
      
        let p2: People
        let data: Data
        do {
            try data = NSKeyedArchiver.archivedData(withRootObject: p1, requiringSecureCoding: true)
            try p2 = NSKeyedUnarchiver.unarchivedObject(ofClass: People.self, from: data)!
          
            print(p2.name)
        } catch  {
            print(error)
        }
    }

}
