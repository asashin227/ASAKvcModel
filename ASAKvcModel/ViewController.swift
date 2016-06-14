//
//  ViewController.swift
//  ASAKvcModel
//
//  Created by Shin on 2016/06/15.
//  Copyright © 2016年 ShinsukeAsakura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dic: Dictionary = ["str0" : "a", "str1" : "b", "str2" : "b", "num0" : 1, "num1" : 2, "num2" : 3]
        let obj: Object = Object(dictionary: dic)
        
        print("str0 : \(obj.str0)")
        print("str1 : \(obj.str0)")
        print("str2 : \(obj.str0)")
        print("num0 : \(obj.num0)")
        print("num1 : \(obj.num1)")
        print("num2 : \(obj.num2)")
        print("dictionaryObject : \(obj.dictionaryObject())")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

