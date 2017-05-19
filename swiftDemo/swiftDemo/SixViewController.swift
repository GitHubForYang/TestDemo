//
//  SixViewController.swift
//  swiftDemo
//
//  Created by YY on 2017/1/17.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit
import Foundation
struct Vector3{
    var x:Double=0.0
    var y:Double=0.0
    var z:Double=0.0
    
    subscript(index:Int)->Double?{
        switch index{
        case 0:return x
        case 1:return y
        case 2:return z
        default:return nil
        }
    }
}
class SixViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
//        let v1=Vector3.init(x: 1, y: 2, z: 3)
        
        
       
        
        
    }
    
//    mark down 语法
//    文档注释
/**
 -kjdghsfgafshdjjhdgs
     
 -dsfasgnhmgjdhstgdf
     
 -dsghdhfyj **hrbstdfc**
     
-oimynu [tbsdfcv](www.imooc.com)
     
     1. item 1
     2. item 2
     3. item 3
     
     
     ```
     let a="hello"
     let b="swift"
     
     ```
     */
    func add(a:Int,b:Int) -> Int {
        return a+b
    }

//    func - (left:Vector3,right:Vector3)->Vector3{ //运算符重载
//        return Vector3(x:left.x+right.x,y:left.y+right.y,z:left.z+right.z)
//    }
    
    
//    inout
    
    func swapTwoInt( a:inout Int, _ b:inout Int) {
        (a,b)=(b,a)
    }
    //范型函数
    func swapTwoThings<T>(a:inout T,b:inout T){
        (a,b)=(b,a)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
