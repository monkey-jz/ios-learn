//
//  SchoolClass+CoreDataProperties.swift
//  CoreDataLearn
//
//  Created by boyaa on 2022/8/17.
//
//

import Foundation
import CoreData


extension SchoolClass {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SchoolClass> {
        return NSFetchRequest<SchoolClass>(entityName: "SchoolClass")
    }

    @NSManaged public var studentCount: Int16
    @NSManaged public var name: String?
    @NSManaged public var major: Student?

}

extension SchoolClass : Identifiable {

}
