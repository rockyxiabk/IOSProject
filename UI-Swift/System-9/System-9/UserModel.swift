//
//  UserModel.swift
//  System-9
//
//  Created by Rocky on 2018/6/23.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

//NSKeyedArchiver 存储解析数据
class UserModel: NSObject,NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.password, forKey: "password")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.password = aDecoder.decodeObject(forKey: "password") as! String
    }
    
    var name: String!
    var password: String!

    override init() {
        
    }
    init( name: String, pwd: String) {
        self.name = name
        self.password = pwd
    }
}
