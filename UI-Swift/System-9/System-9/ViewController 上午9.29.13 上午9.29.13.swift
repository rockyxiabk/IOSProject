//
//  ViewController.swift
//  System-9
//
//  Created by Rocky on 2018/6/23.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appId = UIApplication.shared//获取当前应用的应用实例
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.sendAction( _ :)), name: .UIApplicationWillResignActive, object: appId)
        
        //判断应用程序是否是第一次启动
        let FRIST = "FristLauncher"
        if !UserDefaults.standard.bool(forKey: FRIST) {
            UserDefaults.standard.set(true, forKey: FRIST)
            UserDefaults.standard.synchronize()//提交设置
            print("fristStart")
        }
        else{
            print("restart")
        }
        //获取PList属性列表文件
//        let list = Bundle.main.path(forResource: "demolist", ofType: "plist")
//        let data = NSMutableDictionary.init(contentsOfFile: list!)!
//        let msg = data.description
//        let name = data["name"]
//        let age = data["age"]
//        let year = data["year"]
//        print(msg)
//        print("name:\(String(describing: name))-age:\(String(describing: age))-year:\(String(describing: year))")
        
        //通过代码创建Plist文件
        let dict: NSMutableDictionary = NSMutableDictionary()
        dict.setValue("beijing" as String, forKey: "city")
        dict.setValue("Chain" as String, forKey: "country")
        dict.setValue("beijing" as String, forKeyPath: "city")
        let plistPath = Bundle.main.path(forResource: "demolist", ofType: "plist")//创建plist文件
        dict.write(toFile: plistPath!, atomically: true)//写入到文件中
        //开始读取文件属性
        let data1: NSMutableDictionary = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let msg1 = data1.description
        let city = data1["city"]
        let contury = data1["country"]
        print(msg1)
        print("contury:\(String(describing: contury))-city:\(String(describing: city))")
        
        //NSKeyedArchiver存储解析数据
        let user = UserModel(name: "rocky", pwd: "123456")
        let nsdata = NSMutableData()
        let archive = NSKeyedArchiver(forWritingWith: nsdata)
        archive.encode(user, forKey: "userKey")//进行编码
        archive.finishEncoding()//完成编码
        
        let filePath = NSHomeDirectory() + "/Documents/contacts.data"
        nsdata.write(toFile: filePath, atomically: true)//写入到文件中
        
        let fileData = NSMutableData(contentsOfFile: filePath)
        let unArchive = NSKeyedUnarchiver(forReadingWith: fileData! as Data)//打开文件
        
        let saveuser = unArchive.decodeObject(forKey: "userKey") as? UserModel//解码
        unArchive.finishDecoding()//解码完成
        
        print("name:\(String(describing: saveuser?.name))-pwd:\(String(describing: saveuser?.password))")
        
    }
    
    @objc func sendAction( _ send: AnyObject){
        print("saving data before exit app")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

