//
//  ViewController.swift
//  Utils-11
//
//  Created by Rocky on 2018/6/25.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit
//单例模式的实现和使用
//xml json解析
//coreML机器学习
//ARKit增强现实
//OCR技术
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let s1 = Singleton.singleton
        let s2 = Singleton.singleton
        s1.doSomething()
        s2.action = "walk"
        
        s1.doSomething()
        s2.doSomething()
        
        let path = Bundle.main.path(forResource: "city", ofType: "json")
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path!)) {
            do{
                if let jsonObj:NSDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? NSDictionary{
                    if let city: NSDictionary = jsonObj["p"] as? NSDictionary{
                        if let c:NSArray = city["n"] as? NSArray{
                            for item in c{
                                print("\(item)")
                            }
                        }
                    }
                }
            }catch{
                print(" params error")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

