//
//  ASAKVCModel.swift
//  ASAKvcModel
//
//  Created by Shin on 2016/06/15.
//  Copyright © 2016年 ShinsukeAsakura. All rights reserved.
//

import UIKit

open class ASAKVCModel: NSObject {
    
    /// Initialize
    public override init() {
        super.init()
    }
    
    /// Initialize with parameter from json.
    ///
    /// - Parameter dictionary: Dict from json
    public init(dictionary: [String: AnyObject]) {
        super.init()
        
        dictionary.forEach () {
            if !($1 as AnyObject).isKind(of: NSNull.classForCoder()) {
                (self.setValue($1, forKey: $0))
            }
        }
    }
    
    /// Dictionary from Model object
    ///
    /// - Returns: dictionary
    public func dictionaryObject() -> [String : AnyObject] {
        return self.dictionaryWithValues(forKeys: self.allKeys()) as [String : AnyObject]
    }
    
    
    /// Generate all property and the value for string.
    ///
    /// - Returns: All property and the value
    public func descriptionPropatys() -> String {
        let descriptionString = NSMutableString()
        descriptionString.append("\(self.description)\n")
        let allKeys = self.classForCoder.allKeys()
        for key: String in allKeys {
            let appendedString = "\(key) : \(String(describing: self.value(forKey: key))) \n"
            descriptionString.append(appendedString)
        }
        return NSString(string: descriptionString) as String
    }
    
    /// Parameter Keys in my and sub class.
    ///
    /// - Returns: All parameter keys
    public class func allKeys() -> [String] {
        
        var count: UInt32 = 0
        var names:[String] = []
        let properties = class_copyPropertyList(self.classForCoder(), &count)
        for i in 0..<Int(count) {
            let property = properties?[i]
            let propName = String(cString: property_getName(property))
            
            names.append(propName)
        }
        return names;
    }
    
    
    /// Parameter Keys in my and sub class.
    ///
    /// - Returns: All parameter keys
    public func allKeys() -> [String] {
        return self.classForCoder.allKeys()
    }
    
    open override func setValue(_ value: Any?, forUndefinedKey key: String) {
        #if DEBUG
            print("not found the key '\(key)' in self !!!!");
        #endif
    }
    
    open override func value(forUndefinedKey key: String) -> Any? {
        return nil
    }
}
