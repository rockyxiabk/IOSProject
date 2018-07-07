//
//  SingletonClass.swift
//  Utils-11
//
//  Created by Rocky on 2018/6/25.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class Singleton {
    var action = "Run"
    static let singleton = Singleton()
    
    func doSomething() -> Void {
        print(action)
    }
}
