//
//  Student+CoreDataProperties.swift
//  CoreDataLearn
//
//  Created by boyaa on 2022/8/17.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16

}

extension Student : Identifiable {

}
