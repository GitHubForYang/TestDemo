//
//  ViewController.swift
//  swiftDemo
//
//  Created by YY on 2016/12/30.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit
import Alamofire
//import Kingfisher
import AFNetworking
import SDWebImage
import AlamofireObjectMapper
import CryptoSwift
import ObjectMapper
class ViewController: UIViewController {
//    var btn =varButton()
    var line = UIView()
    let url="https://sov.aeroip.net:8443/crm-webapp/phone_signIn"
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor=UIColor .white
       let btn=UIButton.init(type: .custom)
        btn.frame=CGRect(x:100,y:100,width:100,height:40)
        btn.layer.cornerRadius=20
        btn .setTitle("点击一下", for: .normal)
        btn .setTitleColor(UIColor .red, for: .normal)
        btn .addTarget(self, action: #selector(btnClicked(btn:)), for: .touchUpInside)
        self.view .addSubview(btn)
        btn.backgroundColor=UIColor .cyan
        
        let apples = 3
        let oranges = 5
        let appleSummary = "I have \(apples) apples."
        let fruitSummary = "I have \(apples + oranges) pieces of fruit."
        print(appleSummary)
        print(fruitSummary)
        line=UIView.init(frame: CGRect(x:0,y:self.view.frame.size.height-3,width:50,height:3))
        line.backgroundColor=UIColor .red
        self.view .addSubview(line)
        
        print(ComDigest.encryptedDeviceID())
        print(ComDigest .md5String(from: UIDevice.current.identifierForVendor?.uuidString))
        
        let dict=["loginName":"13262818051","password":"123456"]
        let manager=AFHTTPSessionManager()
        manager.requestSerializer=AFHTTPRequestSerializer()
        manager .securityPolicy.validatesDomainName=false
        manager.securityPolicy.allowInvalidCertificates=true
        manager .post(url, parameters: dict, progress: { (progress) in
            print("Hello world")
       }, success: { (task, responseObjsect) in
//            print(responseObjsect!)
        
       }) { (task, error) in
            print(error);
        }
//    ce99a1ad543ebe788fe7d058cfe5b4db
//    ce99a1ad543ebe788fe7d058cfe5b4db
//        Alamofire.request(url, method:.post, parameters:dict, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//            
//            if let JSON=response.result.value as?Dictionary<String, Any>{
//                print(JSON)
////                print((JSON["contact"]as!Dictionary)["token"]!)
//            }
//        }
    
        
    }
    func btnClicked(btn:UIButton) -> Void {
        
        self.navigationController?.pushViewController(FiveViewController(), animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

