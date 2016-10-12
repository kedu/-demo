//
//  ViewController.swift
//  swift基础
//
//  Created by Apple on 16/10/12.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var finish :(() -> ())?
    var s : Int?
//    ={() -> () in
//    print("21213")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        demo4(2,b: 1,c: 4)
        demo5 { () -> () in
            print("我来了,闭包")
        }
    }
    //闭包//没有名字,没有参数
    func demo5(finished: ()->()){
    
//    finished()
         { () -> () in
            print("我来了,闭包")
        }()

    
    }
    private func demo4(a:Int,b:Int,c:Int) ->Int{
    
    
    
    return a + b
    }
    private func demo3() {
        var dict = ["name":"李康滨","age":18]
        print(dict)
        dict["title"]="女神"
        print(dict)
        dict["name"]="帅哥"
         print(dict)
        dict.removeValueForKey("name")
          print(dict)
        for(key,vlaue) in dict {
        print("key=\(key)")
             print("vlaue=\(vlaue)")
        
        }
        
    
    
    }
    private func demo2(){
    
    let arr1 = [1,2,3]
        let arr2 = [4,5]
        print(arr1+arr2)
    
    
    }
    private func demo1(){
    var array = [1,3,2,343,"李冰冰"]
        for  i  in array {
        print(i)
        
        
        }
        array.append("范冰冰")
        print(array)
        array[0] = "芬姐"
        print(array)
       let ss = array.dropFirst()
        print(ss)
        array.removeFirst()
        print(array)
        

        
    
    
    
    
    
    
    
    }
    private func demo(){
    //截取字符串
     let str = "我是字符串,截取,我过来了"
//        let nsstr = (str as NSString).substringWithRange(NSMakeRange(2, 4));
        let s = str.startIndex.advancedBy(2)
        let end = str.endIndex.advancedBy(-1)
        let ss = str.substringWithRange(s..<end)
        
        print(ss)
        
        
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

