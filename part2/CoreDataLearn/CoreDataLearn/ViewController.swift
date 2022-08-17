//
//  ViewController.swift
//  CoreDataLearn
//
//  Created by boyaa on 2022/8/17.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        //获取用CoreDataLearn.xcdatamodeld创建的数据模型文件地址
        let modleUrl = Bundle.main.url(forResource: "CoreDataLearn", withExtension: "momd")
        //创建数据模型管理实例
        let modleManager = NSManagedObjectModel(contentsOf: modleUrl!)
        //创建存储管理实例
        let store = NSPersistentStoreCoordinator(managedObjectModel: modleManager!)
        //设置存储路径
        let path = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/SchoolSQL.sqlite" )
        print(path)
        //设置存储方式为SQLite数据库
        try? store.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: path, options: nil)
        //创建数据操作上下文实例
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        //关联存储环境
        context.persistentStoreCoordinator = store
        //创建SchoolClass数据
        let schoolClass: SchoolClass = NSEntityDescription.insertNewObject(forEntityName: "SchoolClass", into: context) as! SchoolClass
        schoolClass.name = "三年二班"
        schoolClass.studentCount = 20
        //创建Student数据
        let student: Student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        student.name = "周杰伦"
        student.age = 9
        schoolClass.major = student
        //存储数据
        if (try? context.save()) != nil {
            print("新增数据成功")
        }
        //创建请求
        let request = NSFetchRequest<SchoolClass>(entityName: "SchoolClass")
        //设置查询条件
        request.predicate = NSPredicate(format: "studentCount==20")
        //执行查询操作
        let result: NSAsynchronousFetchResult<SchoolClass> = try! context.execute(request) as! NSAsynchronousFetchResult<SchoolClass>
        print(result.finalResult?.first?.major?.name)
        
     
    }


}

