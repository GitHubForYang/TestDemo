//
//  Player.swift
//  swiftDemo
//
//  Created by YY on 2017/1/13.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit

class Player: NSObject {
    var name:String
    var score=0 //实例变量
    static var hihgestScore=0//静态属性   不是实例变量
    init(name:String) {
        self.name=name
    }
    func play(){
        let score=20
        self.score+=score
        print(self.score)
        if self.score>Player.hihgestScore {
            Player.hihgestScore=self.score
            print(Player.hihgestScore)
        }
    }
}

