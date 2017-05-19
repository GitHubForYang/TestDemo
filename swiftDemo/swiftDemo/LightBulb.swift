//
//  LightBulb.swift
//  swiftDemo
//
//  Created by YY on 2017/1/16.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit

class LightBulb: NSObject {
    static let maxCurrent=30
    var current=0{
        willSet(newCurrent){
            print("current is change")
        }
        didSet(oldCurrent){
            if current==LightBulb.maxCurrent {
                print("pay attention")
            }else if current>LightBulb.maxCurrent{
                print("current too high")
                current=oldCurrent
            }
            print("The current is \(current)")
        }
    }
}


