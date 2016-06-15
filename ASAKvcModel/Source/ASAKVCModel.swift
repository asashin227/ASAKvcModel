//
//  ASAKVCModel.swift
//  ASAKvcModel
//
//  Created by Shin on 2016/06/15.
//  Copyright © 2016年 ShinsukeAsakura. All rights reserved.
//

import UIKit

class ASAKVCModel: NSObject {
    init(dictionary: [String: AnyObject]) {
        super.init()
        dictionary.forEach{(self.setValue($1, forKey: $0))}
    }
    
    func dictionaryObject() -> [String : AnyObject] {
        return self.dictionaryWithValuesForKeys(self.dynamicType.allKeys())
    }
    
    func descriptionPropatys() -> String {
        let descriptionString = NSMutableString()
        descriptionString.appendString("\(self.description)\n")
        let allKeys = self.dynamicType.allKeys()
        for key: String in allKeys {
            let appendedString = "\(key) : \(self.valueForKey(key)) \n"
            descriptionString.appendString(appendedString)
        }
        return NSString(string: descriptionString) as String
    }
    
    class func allKeys() -> [String] {
        
        var count: UInt32 = 0
        var names:[String] = []
        let properties = class_copyPropertyList(self.classForCoder(), &count)
        for i in 0..<Int(count) {
            let property = properties[i]
            let propName = String(UTF8String: property_getName(property))
            
            names.append(propName!)
        }
        return names;
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        #if DEBUG
            print("Class : \(self.dynamicType)(don't have the key : \(key))")
        #endif
    }
    
    override func valueForUndefinedKey(key: String) -> AnyObject? {
        #if DEBUG
            print("Class : \(self.dynamicType)(don't have the key : \(key))")
        #endif
        return nil
    }
}

