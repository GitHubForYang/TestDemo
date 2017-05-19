//
//  Person.swift
//  swiftDemo
//
//  Created by YY on 2017/1/13.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit
//  类是一个引用类型
class Person: NSObject {
    var firstName:String
    var lastName:String
    init(firstName:String,lastName:String) {
        self.firstName=firstName
        self.lastName=lastName
        
    }
    init?(fullName:String) {
        guard let spaceIndex=fullName.range(of: " ")?.lowerBound else {
            return nil
        }
        self.firstName=fullName.substring(to: spaceIndex)
        self.lastName=fullName.substring(from: fullName.index(after: spaceIndex))
    }
}

let p1=Person.init(fullName: "li si")
let p2=Person.init(firstName: "zhang", lastName: "san")
