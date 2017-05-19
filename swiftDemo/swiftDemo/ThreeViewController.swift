//
//  ThreeViewController.swift
//  swiftDemo
//
//  Created by YY on 2017/1/11.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor=UIColor .white
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)//类型转换 string型转int
        print(convertedNumber!)
        
        var a = 1
        a += 2
        a -= 1
        
        
        
        let contentHeight = 40
        let hasHeader = true
        let rowHeight = contentHeight + (hasHeader ? 50 : 20)//三目运算符  表达式1？表达2:表达3   若表达式1为真取表达式2的值，为假取表达式3的值
        print(rowHeight)//90
//        空合运算符     a != nil ? a! : b
        let defaultColorName = "red"
        var userDefinedColorName: String?   //默认值为 nil
        userDefinedColorName = "green"
        let colorNameToUse = userDefinedColorName ?? defaultColorName
        print(colorNameToUse)
//        空间运算符
        for index in 1..<5 {
            print(index)
        }
        
        let initialBits: UInt8 = 0b00001111
        let invertedBits = ~initialBits //按位取反运算符是一个前缀运算符，需要直接放在运算的数之前
        print(invertedBits)
        
        
        let firstSixBits: UInt8 = 0b11111100
        let lastSixBits: UInt8  = 0b00111111
        let middleFourBits = firstSixBits & lastSixBits//按位与
        print(middleFourBits)
        
        let someBits: UInt8 = 0b10110010
        let moreBits: UInt8 = 0b01011110
        let combinedbits = someBits | moreBits//按位或
        print(combinedbits)
        
        let firstBits: UInt8 = 0b00010100
        let otherBits: UInt8 = 0b00000101
        let outputBits = firstBits ^ otherBits//按位异或
         print(outputBits)
        let shiftBits: UInt8 = 4 // 即二进制的 00000100
//        shiftBits << 1           // 00001000
//        shiftBits << 2           // 00010000
//        shiftBits << 5           // 10000000
//        shiftBits << 6           // 00000000
//        shiftBits >> 2           // 00000001
        print(shiftBits)
        let pink: UInt32 = 0xCC6699
        let redComponent = (pink & 0xFF0000) >> 16  // redComponent 是 0xCC，即 204
        print(redComponent)
        let greenComponent = (pink & 0x00FF00) >> 8 // greenComponent 是 0x66， 即 102
        print(greenComponent)
        let blueComponent = pink & 0x0000FF         // blueComponent 是 0x99，即 153
        print(blueComponent)
        
        
        var unsignedOverflow = UInt8.max
        // unsignedOverflow 等于 UInt8 所能容纳的最大整数 255
        unsignedOverflow = unsignedOverflow &+ 1//上溢出
        // 此时 unsignedOverflow 等于 0
        
        
//        类和结构体可以为现有的运算符提供自定义的实现，这通常被称为运算符重载。
        struct Vector2D {
            var x = 0.0, y = 0.0
        }
        func aaa(left: Vector2D, right: Vector2D) -> Vector2D {
            return Vector2D(x: left.x + right.x, y: left.y + right.y)
        }
        let arrays=[Int](arrayLiteral: 1,2,3,4,5,6)
       
        for (index,value) in arrays.enumerated() {
            print("++\(index)++\(value)++")
         
        }

        var someInts = [Int]()
        someInts=[1,2,3,4]
        print("someInts is of type [Int] with \(someInts.count) items.")
        
        let numbers = [10, 20, 30, 40, 50]
          if let i = numbers.index(of: 30) {
               print(numbers[i ..< numbers.endIndex])
            }
       
        var namesOfIntegers = [Int: String]()
        namesOfIntegers=[1:"asd",2:"zxc"]
        namesOfIntegers[3]="qwer"
        print(namesOfIntegers)
        
//        let str=namesOfIntegers[1]!
        print(namesOfIntegers[3]!)
        let airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        print(airports.enumerated())
        
        struct FixedLengthRange {
            var firstValue: Int
            let length: Int
        }
        let rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        // 该区间表示整数0，1，2
        print(rangeOfThreeItems)
        _=Array<Any>()
        
        struct Point1{
            var x=0.0,y=0.0
        }
        let pmj=String()
            print(pmj)
        
        struct Point {
            var x = 0.0, y = 0.0
        }
        struct Size {
            var width = 0.0, height = 0.0
        }
        struct Rect {
            var origin = Point()
            var size = Size()
            var center: Point {
                get {
                    let centerX = origin.x + (size.width / 2)
                    let centerY = origin.y + (size.height / 2)
                    return Point(x: centerX, y: centerY)
                }
                set(newCenter) {
                    origin.x = newCenter.x - (size.width / 2)
                    origin.y = newCenter.y - (size.height / 2)
                }
            }
        }
        var square = Rect(origin: Point(x: 0.0, y: 0.0),size: Size(width: 10.0, height: 10.0))
        let initialSquareCenter = square.center
        print(initialSquareCenter)
        square.center = Point(x: 15.0, y: 15.0)
        print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
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
