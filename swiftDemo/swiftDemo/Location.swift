//
//  Location.swift
//  swiftDemo
//
//  Created by YY on 2017/1/16.
//  Copyright © 2017年 yosemite. All rights reserved.
//

import UIKit

class Locations: NSObject {
    let latitude:Double
    let longitude:Double
    lazy var address:String?={
        //执行经纬度解析
        return nil
    }()
    init(latitude:Double,longitude:Double) {
        self.latitude=latitude
        self.longitude=longitude
    }

}
class Book:NSObject{
    let name:String
    lazy var content: String? = {
        //从本地读取书的内容
        return nil
    }()
    init(name:String) {
        self.name=name
    }
}

class Web{
    let url:String
    lazy var html: String? = {
        //从网络读取url对应的html
        return nil
    }()
    init(url:String) {
        self.url=url
    }
}











































