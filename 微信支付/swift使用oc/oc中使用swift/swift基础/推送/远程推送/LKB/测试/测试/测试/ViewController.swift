//
//  ViewController.swift
//  测试
//
//  Created by Apple on 16/10/17.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bb: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let x = VV()
        x.frame = CGRect(x: 0, y: 0, width: 375, height: 200)
        x.backgroundColor = UIColor.orangeColor()
        bb.addSubview(x)
//        view.addSubview(x)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

