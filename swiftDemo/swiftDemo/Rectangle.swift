//
//  Rectangle.swift
//  swiftDemo
//
//  Created by YY on 2017/1/13.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit
struct Point {
    var x=0.0
    var y=0.0
}
struct Size {
    var width=0.0
    var height=0.0
}
class Rectangle {
    var origin=Point()
    var size=Size()
    var center:Point{//计算型属性   必须声明成var  
        get{
            let centerX=origin.x+size.width/2
            let centerY=origin.y+size.height/2
            return Point.init(x: centerX, y: centerY)
        }
        set{
            origin.x=newValue.x-size.width/2
            origin.y=newValue.y-size.height/2
        }
        
    }
    init(origin:Point,size:Size) {
        self.origin=origin
        self.size=size
    }
}

//  类扩展   扩展方法   扩展结构体
extension Rectangle{
    func translate(x:Double,y:Double){
        self.origin.x+=x
        self.origin.y+=y
    }
}
//扩展计算型属性
//extension Rectangle{
//    var center:Point{
//        get{
//            let centerX=origin.x+size.width/2
//            let centerY=origin.y+size.height/2
//            return Point(x:centerX,y:centerY)
//        }
//    }
//}
//let rect=Rectangle.init(origin: Point(), size: Size())
//rect.center=Point.init(x: 10, y: 10)

//扩展构造函数必须是convenience类型




//嵌套类型

extension Rectangle{
    enum Vertex:Int {
        case LeftTop
        case RightTop
        case RightBottom
        case LeftBottom
    }
    func pointAtVertex(v:Vertex) -> Point {
        switch v {
        case .LeftTop:
            return origin
        case .RightTop:
            return Point(x:origin.x+size.width,y:origin.y)
        case .RightBottom:
            return Point(x:origin.x+size.width,y:origin.y+size.height)
        case .LeftBottom:
            return Point(x:origin.x,y:origin.y+size.height)
        }
    }
    subscript(index:Int)->Point{
        return pointAtVertex(v: Vertex(rawValue:index)!)
    }
}

// 扩展标准库
extension Int{
    var square:Int{
        return self*self
    }
    var cube:Int{
        return self*self*self
    }
    func inRange(closedLeft left:Int,openedRight:Int)->Bool{
        return self>=left&&self<openedRight
    }
    func repetitions(task: ()->Void){
        for _ in 0..<self {
            task()
        }
    }
    
}
























































