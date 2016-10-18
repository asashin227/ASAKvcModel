//
//  ASAKVCModel.swift
//  ASAKvcModel
//
//  Created by Shin on 2016/06/15.
//  Copyright © 2016年 ShinsukeAsakura. All rights reserved.
//

import UIKit

class ASAKVCModel: NSObject {
	/**
	Initialize with parameter from json.
	
	- parameter dictionary: json
	
	- returns: ASAKVCModel object
	*/
	init(dictionary: [String: AnyObject]) {
		super.init()
		dictionary.forEach{(self.setValue($1, forKey: $0))}
	}
	
	/**
	Dictionary from ASAKVCModel object
	
	- returns: dictionary
	*/
	func dictionaryObject() -> [String : AnyObject] {
		return self.dictionaryWithValues(forKeys: self.allKeys()) as [String : AnyObject]
	}
	
	
	/**
	Generate all property and the value for string.
	
	- returns: all property and the value
	*/
	func descriptionPropatys() -> String {
		let descriptionString = NSMutableString()
		descriptionString.append("\(self.description)\n")
		let allKeys = self.classForCoder.allKeys()
		for key: String in allKeys {
			let appendedString = "\(key) : \(self.value(forKey: key)) \n"
			descriptionString.append(appendedString)
		}
		return NSString(string: descriptionString) as String
	}
	
	/**
	Parameter keys in my and sub class.
	
	- returns: All parameter keys
	*/
	class func allKeys() -> [String] {
		
		var count: UInt32 = 0
		var names:[String] = []
		let properties = class_copyPropertyList(self.classForCoder(), &count)
		for i in 0..<Int(count) {
			let property = properties?[i]
			let propName = String(describing: property_getName(property))
			
			names.append(propName)
		}
		return names;
	}
	
	/**
	Parameter keys in my and sub class.
	
	- returns: All parameter keys
	*/
	func allKeys() -> [String] {
		return self.classForCoder.allKeys()
	}
	
}
