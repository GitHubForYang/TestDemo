//
//  FiveViewController.swift
//  swiftDemo
//
//  Created by YY on 2017/1/13.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit

struct Location{
    var latitude:Double
    var longitude:Double
    init?(coordinateString:String){//结构体的构造函数
        guard let commaIndex=coordinateString.range(of: ",")?.lowerBound,
            let firstElement=Double(coordinateString.substring(to: commaIndex)),
            let secondElement=Double(coordinateString.substring(from: coordinateString.index(after: commaIndex)))
            else{
                return nil
        }
        self.latitude=firstElement//类型转换  string转double
        self.longitude=secondElement
    }
    init(latitude:Double,longitude:Double) {
        self.latitude=latitude
        self.longitude=longitude
    }
    mutating func goEast(){  //mutating 关键字  用它修饰可以自己修改自己
        self.latitude += 1
    }
}
struct Matrix {
    var m:[[Int]]
    var row:Int
    var col:Int
    init?(_ arr2d:[[Int]]) {
        guard arr2d.count>0 else {
            return nil
        }
        let row=arr2d.count
        let col=arr2d[0].count
        for i in 1..<row {
            if arr2d[i].count != col {
                return nil
            }
        }
        self.m=arr2d
        self.row=row
        self.col=col
    }
    func printMatrix(){
//        for i in 0..<row {
//            for j in 0..<col {
//                
//            }
//        }
    }
}
class FiveViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor=UIColor .white
//        结构体
        
        let appleLocation=Location(latitude: 27.232, longitude: 122.032)
        print(appleLocation.latitude)
        
        struct Place{
            let location:Location
            var name:String
        }
        let google=Place.init(location: appleLocation, name: "google")
        print(google.location.latitude)
        let baidu=Location.init(coordinateString: "21.232&122.313")
        print(baidu ?? 1)
        
        
        
        
//      value type  值类型  赋值即copy  闭包是引用类型reference type   枚举也是值类型   引用类型赋值是同一内存空间    值类型是不同的两个内存空间
    
        struct Point{
            var x = 0
            var y = 0
        }
//        Dictionary ,Array ,Set 是结构体
//        Int,Float,Double,String,Bool 也都是结构
        let a:Int=1
        print(a.distance(to: 100))
        

        
        enum Switch{
            case On
            case Off
            mutating func click(){
                switch self {
                case .On:
                    self = .Off
                case .Off:
                    self = .On
                }
            }
        }
        
        var btn=Switch.Off
        btn.click()
        
//        1.存储型属性  2.计算型属性 3.类型属性 4.属性观察器 5.
        
        
        
        let p1=Player.init(name: "player1")
        p1 .play()
        
        
        
    
//        4.属性观察器 
        
        let bulb=LightBulb()
        bulb.current=20
        bulb.current=40
        
        
        
        let ui=UI.init(themeMode: .DayMode)
        print(ui.themeMode)
        print(ui.fontColor)
        print(ui.backgroundColor)
        
        
        
       let closed=ClosedRange.init(start: 1, end: 10)
        print(closed?.sum ?? 1)
        
        
        
//        访问控制
//        public :可以被模块外访问
//        internal:可以被本模块访问   默认情况下是internal
//        private :可以被本文件访问
//        fileprivate
        
        

        
        
        let gm=GameManager.defaultGameManager
        gm.addScore()
        
        
        
        
        
     //        convenience 方便的构造函数
        
        
//        如果子类实现了父类所有的指定构造函数，则自动继承父类的所有的便利构造函数  如果子类没有实现父类的构造函数，
        
        
//        required必须被子类实现的构造函数
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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
