//
//  FourViewController.swift
//  swiftDemo
//
//  Created by YY on 2017/1/12.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit

class FourViewController: UIViewController {
    var arr1=[String]() //创建一个空数组
    
    var arr2:Array<String>=Array()
    
    var arr3=Array<String>()
   
    var str=String()//创建一个空字符串
    
    var dict=[Int:Any]()
    var dict1=Dictionary<String, Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor .white
        arr2=["1","2","s","f","y"]
        print(arr2.count)
        print(arr2.isEmpty)
        arr2.append("2")
        arr2+=["3"]
        arr2.insert("5", at: 0)
        arr2.remove(at: 0)
//        arr2.removeAll()
        arr2.removeLast()
        arr2.removeFirst()
        arr2[0]="aaa"
        arr2[2...4]=["cc","dd","eee"]
        
        arr3=[]
        let arr4=[Int](repeatElement(0, count: 10))
        for index in 0..<arr2.count {
            print(arr2[index])
        }
        for index in arr4 {
            print(index)
        }
        dict=[1:"a",2:"b",3:"c"]
        print(dict.count)
        dict=[:]//清空字典
        dict=[Int:String]()
        print(dict.isEmpty)
        print(dict[2] ?? 1)
        dict[4]="asd"
        dict.updateValue("qwer", forKey: 1)
        dict[1]=nil//删除一个键对应的值
        dict.removeValue(forKey: 2)
        dict.removeAll()
        for (key,value)in dict{
        print("\(key)+++++\(value)")
        }
        print(dict.values)
        print(dict.keys)
        for key in dict.keys {
            print(key)
        }
        for value in dict.values {
            print(value)
        }
        
        let aa={(a:Int,b:Int)->Bool in
                return a>b
        }
        
        print(aa)
        var arr5=[1,2,3,4,5,6,7,8,9]
//        arr5=arr5.sorted(by: {(a,b)->Bool in
//            return a>b
//        })
//        arr5=arr5.sorted(by:{a,b in return a>b})
//       arr5=arr5.sorted(by:{a,b in a>b})
//        arr5=arr5.sorted(by: >)
//        arr5=arr5.sorted(by: {$0>$1})
//        arr5=arr5.sorted(){a,b in return a>b}
        arr5=arr5.sorted{a,b in return a>b}
        print(arr5)
        let view=UIView.init(frame: CGRect(x:0,y:0,width:50,height:50))
        
        view.backgroundColor=UIColor .orange
       view.center=self.view.center
        
        UIView.animate(withDuration: 2.0) {
           
            view.frame=CGRect(x:0,y:0,width:250,height:250)
            view.layer.cornerRadius=view.frame.size.width/2
            view.center=self.view.center
        }
        
        var arr6=[102,95,105,92,103,89]
        let num=100//闭包内容捕获num
        arr6=arr6.sorted{
        a,b in
            abs(a-num)<abs(b-num)//离100最近
        }
        print(arr6)
        
//        闭包和函数是应用类型
        func runningMeterWithMetersPerDay(metersPerDay:Int)->()->Int{
            var totalMeters=0
            return {//return回一个类型()->Int的闭包（函数）
            totalMeters+=metersPerDay
                return totalMeters
            }
        }
        let planA=runningMeterWithMetersPerDay(metersPerDay: 2000)
        print(planA())
        print(planA())
        print(planA())
        
        let planB=runningMeterWithMetersPerDay(metersPerDay: 3000)
        print(planB())
        print(planB())
        print(planB())
        
//        struct direction{
//            let North = 1
//            let South = 2
//            let East  = 3
//            let West  = 4
//        }
        
//        枚举
        
        enum Season{
            case Spring, Summer, Autumn, Winter
        }
        
        enum Month:Int{
            case January=1
            case February=2
            case March=3
            case April=4
            case May=5
            case June=6
            case July=7
            case August=8
        }
        func monthBeforeNewYear(month:Month)->Int{
            return 12-month.rawValue//原始值
        }
//        枚举关联值   与原始值互斥   可以关联多个值并起一个名字
        enum ATMStatus{
            case Success(success:Int)
            case Error(String)
            case Waiting
        }
        var balence=1000
        func withDraw(amount:Int)->ATMStatus
        {
            if balence>=amount {
                balence-=amount
                return .Success(success:balence)
            }else{
                return .Error("余额不足")
            }
        }
        let res=withDraw(amount: 1200)
        switch res {
        case let .Success(newbalence):
            print(newbalence)
        case let .Error(errorMessage):
            print(errorMessage)
        case .Waiting:
            print("waiting")
        }
//        可选型
        var website:Optional<String>=Optional.some("baidu.com")
        website = .none
        website="imooc.com"
        website=nil
        print(website ?? 1)
//      枚举递归   关键字indirect
        
        enum ArithmeticExperssion{//或者在enum前加indirect
            case Number(Int)
           indirect case Addition(ArithmeticExperssion,ArithmeticExperssion)
           indirect case Multiplication(ArithmeticExperssion,ArithmeticExperssion)
        }
        let five=ArithmeticExperssion.Number(5)
        let four=ArithmeticExperssion.Number(4)
        let sum=ArithmeticExperssion.Addition(five, four)
        let product=ArithmeticExperssion.Multiplication(sum, five)
        print(product)
        
        func evaluate(experssion:ArithmeticExperssion)->Int{
            switch experssion  {
            case let ArithmeticExperssion.Number(value):
                return value
            case let ArithmeticExperssion.Addition(left, right):
                return evaluate(experssion: left)+evaluate(experssion: right)
            case let ArithmeticExperssion.Multiplication(left, right):
                return evaluate(experssion: left)+evaluate(experssion: right)
        }
        }
        
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
