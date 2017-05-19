//
//  Avatar.swift
//  swiftDemo
//
//  Created by YY on 2017/1/16.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit

class Avatar: NSObject {
    var name:String
    var life=100
    var isAlive:Bool=true
    init(name:String) {
        self.name=name
    }
    func beAttacked(attack:Int){
        life-=attack
        if life<=0 {
            isAlive=false
        }
    }
}
//        类的继承
final class User: Avatar {//final修饰的类 User不能再被继承     final修饰的方法不能被重载
    var score=0
    
}

 //override重载的关键字   属性和方法都可以重载      重载即覆盖
/*
如果父类的方法或者属性用final修饰，则子类不能重写该方法或者属性
1、只能重写计算型属性，不能重写存储型属性
2、final可以修饰类，类型方法，类型属性，实例方法，属性，下标
3、类型方法可以用class或static修饰，static修饰的方法子类不能重写，final class修饰的类型也不能重写，二者等价
*/





































