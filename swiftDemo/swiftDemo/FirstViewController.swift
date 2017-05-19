//
//  FirstViewController.swift
//  swiftDemo
//
//  Created by YY on 2016/12/30.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var str=String()
    
    struct FixedLengthRange {
        var firstValue: Int
        let length: Int
    }
//    编译器会自动推断类型。
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor .groupTableViewBackground
        
        for index in 0...9 {
            print(index)
        }
        
        let individualScores = [75, 43, 103, 87, 12]
        var teamScore = 0
        for score in individualScores {
            if score > 50 {
                teamScore += 3
            } else {
                teamScore += 1
            }
        }
        print("===\(teamScore)====")
        
        var total = 0
        for i in 0..<4 {
            total += i
        }
        print(total)
        
        
        func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
            var min = scores[0]
            var max = scores[0]
            var sum = 0
            
            for score in scores {
                if score > max {
                    max = score
                } else if score < min {
                    min = score
                }
                sum += score
            }
            
            return (min, max, sum)
        }
        let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
        print(statistics.sum)
        print(statistics.2)
        
        // Do any additional setup after loading the view.
        
        func sumOf(numbers: Int...) -> Int {
            var sum = 0
            for number in numbers {
                sum += number
            }
            return sum
        }
        let a=sumOf(numbers: 42, 597, 12)
        print(a)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
