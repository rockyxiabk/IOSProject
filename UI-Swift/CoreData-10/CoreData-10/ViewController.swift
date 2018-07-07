//
//  ViewController.swift
//  CoreData-10
//
//  Created by Rocky on 2018/6/25.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate//获得当前应用程序的代理对象
        let manager = appDelegate.persistentContainer.viewContext//获得管理对象的上下文
        
//        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: manager) as! User
//        user.name = "rocky"
//        user.age = 26
//        user.pwd = "hanocenrmogans"
//        do {
//            try manager.save()
//            print("insert success")
//        } catch {
//            print("error insert")
//        }
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: manager)//根据上下文获得实体管理对象
        let request = NSFetchRequest<User>(entityName: "User")//提取请求对象
        request.fetchOffset = 0//设置提取对象的偏移值
        request.fetchLimit = 10
        request.entity = entity
        do {
            //query update
            let results : [AnyObject]? = try manager.fetch(request)
            print("query success")
            for item:User in results as! [User] {
            item.name = "danny"
                print("\(String(describing: item.name))+age:\(item.age)+pwd:\(String(describing: item.pwd))")
            }
            try manager.save()
            //delete
            let results1: [AnyObject]? = try manager.fetch(request)
            for item:User in results1 as! [User] {
                print("\(String(describing: item.name))+age:\(item.age)+pwd:\(String(describing: item.pwd))")
            }
            for item:User in results1 as! [User] {
                manager.delete(item)
            }
            try manager.save()
            //query
            let results2: [AnyObject]? = try manager.fetch(request)
            for item:User in results2 as! [User] {
                print("\(String(describing: item.name))+age:\(item.age)+pwd:\(String(describing: item.pwd))")
            }
        } catch {
            print("query error")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

