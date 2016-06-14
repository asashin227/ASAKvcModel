//
//  ASAKVCModel.swift
//  ASAKvcModel
//
//  Created by Shin on 2016/06/15.
//  Copyright © 2016年 ShinsukeAsakura. All rights reserved.
//

import UIKit

class ASAKVCModel: NSObject {
    init(dictionary: [String : AnyObject]) {
        super.init()
        if dictionary.count == 0 {
            return
        }
        
        let allPropertyKeys = self.dynamicType.allKeys()
        
        for key: String in allPropertyKeys {
            let val = dictionary[key]
            if val != nil && val != nil {
                self.setValue(val, forKey: key)
            }
        }
    }
    
    func dictionaryObject() -> [String : AnyObject] {
        let allKeys = self.dynamicType.allKeys()
        return self.dictionaryWithValuesForKeys(allKeys)
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
        
        var names: [String] = []
        var count: UInt32 = 0
        self.classForCoder()
        let properties:UnsafeMutablePointer<objc_property_t> = class_copyPropertyList(self.classForCoder(), &count)
        
        for i: UInt32 in 0..<count {
            let property = properties[Int(i)];
            let cname = property_getName(property)
            let name = String.fromCString(cname)
            
            names.append(name!)
            
        }
        free(properties)
        return names
    }
}

