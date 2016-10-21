//
//  VV.swift
//  测试
//
//  Created by Apple on 16/10/17.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class VV: UITextView {
    var v1 : UILabel?
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        let v1 = UILabel()
        v1.text = "我来了啦啦啦啦啦了"
        addSubview(v1)
        self.v1 = v1
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        v1?.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
