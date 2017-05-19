//
//  ClosedRange.swift
//  swiftDemo
//
//  Created by YY on 2017/1/16.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit

class ClosedRange: NSObject {
    var start:Int = 0
    var end:Int = 0
    var width:Int{
        return end-start+1
    }
    lazy var sum:Int={
        print("sum")
        var res=0
        for i in self.start...self.end {
            res+=i
        }
        return res
    }()
    init?(start:Int,end:Int) {
        if start>end {
            return nil
        }
        self.start=start
        self.end=end
        
    }
}












































