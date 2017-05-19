//
//  GameManager.swift
//  swiftDemo
//
//  Created by YY on 2017/1/16.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit
//import Foundation
public class GameManager{
    public var score=0
    public static let defaultGameManager=GameManager()
    private init(){
    
    }
    public func addScore(){
        score+=10
    }
}
//     单例模式
