//
//  UI.swift
//  swiftDemo
//
//  Created by YY on 2017/1/16.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit


//  属性观察器的willSet和didset不会在初始化的时候被调用，init和直接赋初始值这个属性的时候不会调用属性观察器

class UI: NSObject {
    enum Theme{
        case DayMode
        case NightMode
    }
    var fontColor:UIColor!
    var backgroundColor:UIColor!
    var themeMode:Theme = .DayMode{
        didSet{
            self.changeTheme(themeMode1: themeMode)
        }
    }
   
    
    init(themeMode:Theme) {
        self.themeMode=themeMode
        super.init()
        self.changeTheme(themeMode1: themeMode)
//        switch themeMode {
//        case .DayMode:
//            fontColor=UIColor.black
//            backgroundColor=UIColor.white
//        case .NightMode:
//            fontColor=UIColor.white
//            backgroundColor=UIColor.black
//        }
    }
    private func changeTheme( themeMode1: Theme ){
        switch themeMode {
        case .DayMode:
            fontColor=UIColor.black
            backgroundColor=UIColor.white
        case .NightMode:
            fontColor=UIColor.white
            backgroundColor=UIColor.black
        }
    }
    
}
























































