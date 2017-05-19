//
//  EightViewController.swift
//  swiftDemo
//
//  Created by YY on 2017/1/18.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit
typealias Length = Double
extension Double{
    var km:Length{return self*1000.0}
    var m:Length{return self}
    var cm:Length{return self/100}
    var ft:Length{return self/3.28084}
}
protocol WeightCalculable{
    associatedtype WeightType   //协议关联WeightType
    var weight:WeightType{ get }
}
class iPhone7:WeightCalculable{
    typealias WeightType = Double
    var weight:WeightType{
        return 0.114
    }
}
class Ship:WeightCalculable{
    typealias WeightType = Int
    let weight:WeightType
    init(weight:Int) {
        self.weight=weight
    }
}
struct Record:Equatable,Comparable,CustomStringConvertible{
    var wins:Int
    var losses:Int
    var description: String{
        return "wins:"+String(wins)+",losses:"+String(losses)
    }
    
}

func ==(left:Record,right:Record)->Bool{
    return left.wins==right.wins&&right.losses==left.losses
}
func <(left:Record,right:Record)->Bool{
    if left.wins != right.wins{
        return left.wins<right.wins
    }
    return left.losses>right.losses
}
class EightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        let runningDistance:Length=3.54.km
        
//        扩展协议，可在扩展里实现协议逻辑
        
//        协议聚合    protocol<协议1,协议2>
//        泛型约束
        for i in (1...10).reversed() {
            print(i)
        }
        
        for i in stride(from: 0, to: 10, by: 2) {
            print(i)
        }
        for i in stride(from: 0, through: 10, by: 2) {
            print(i)
        }
        for i in stride(from: 0, through: 5, by: 0.1) {
            print(i)
        }
        
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































































