//
//  People.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/16.
//

import UIKit

class People: NSObject,NSCoding ,NSSecureCoding{
    var name: String
    var age: Int
    init(name: String,age: Int) {
        self.name = name
        self.age = age
        print("init 11111111")
        super.init()
        print("init 22222222")
    }
    func encode(with coder: NSCoder) {
        print("encode 1111111")
        coder.encode(self.name,forKey: "nameKey")
        coder.encode(self.age,forKey: "ageKey")
    }
    
    required init?(coder: NSCoder) {
        print("init 33333333")
        self.name = coder.decodeObject(forKey: "nameKey") as! String
        self.age = coder.decodeInteger(forKey: "ageKey")
        super.init()
        print("init 444444444")
    }
    
    static var supportsSecureCoding: Bool{
        return true
    }
    

}
