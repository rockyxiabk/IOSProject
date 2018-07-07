//
//  User+CoreDataProperties.swift
//  CoreData-10
//
//  Created by Rocky on 2018/6/25.
//  Copyright © 2018年 Rocky. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var pwd: String?

}
