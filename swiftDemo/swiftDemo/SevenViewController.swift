//
//  SevenViewController.swift
//  swiftDemo
//
//  Created by YY on 2017/1/17.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit
struct Stack<T>{
    var items=[T]()
    func isEmpty()->Bool{
        return items.count==0
    }
    mutating func push(item:T){
        items.append(item)
    }
    mutating func pop()->T?{
        guard !self.isEmpty() else {
            return nil
        }
        return items.removeLast()
    }
}

extension Stack{
    func top() -> T? {
        return items.last
    }
}

struct Pair<T1,T2>{
    var a:T1
    var b:T2
}

//      协议
protocol Pet {
    var name:String{get set}//可读可写
    var birthPlace:String{get}//只读
    
    func playWith()
//    func fed(food:String)->String
    mutating func changeName(newName:String)
}
struct Dog:Pet{
   var name: String="asd"
    let birthPlace: String="zxc"
    func playWith() {
       print("wang wang wang !!!")
    }
    mutating func changeName(newName: String) {
        name=newName
    }
}
/*
1.在类中给属性赋值，则类默认有一个，不含任何参数的构造函数。此时，可不实现构造函数。
2.一个类同时继承父类，遵守一个协议，此时父类写在最前面（一个类只能继承一个父类）；
3.类构造函数包含required，子类需要重写此构造函数，除非该类前有final，表明不能被继承；
4.子类重写父类构造函数时，需要添加override，如果父类构造函数含required，则子类只需required；
5.子类同时继承父类，遵守协议，则：
(1)父类构造函数含required，子类需含required，此时required也被认为满足协议的要求；
(2)父类构造函数不含required，则子类构造函数需同时包含required、override；其中required表示满足协议的要求，override表示重写构造函数；
 
 */
class SevenViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pair=Pair<Int,String>(a:0,b:"hello")
        print(pair)
        // Do any additional setup after loading the view.
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
