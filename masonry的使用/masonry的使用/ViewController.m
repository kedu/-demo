//
//  ViewController.m
//  masonry的使用
//
//  Created by Apple on 16/8/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    约束的公式:
    // firstitem (less than or equal||equal||great than or equal) seconditem*multiplier+constant
    //priority 优先级
    //在view上添加是imageView,button,label,textFiled
    //imageView距离顶部20,左右 0,下self.view.frame.size.height*2/3
    //设置约束更简单了,不用设置autoresize
    //约束更简洁明了
    
    //imageView
    UIImageView*imageView=[[UIImageView alloc]init];
    imageView.backgroundColor=[UIColor redColor];
      [self.view addSubview:imageView];
    UIView *superview=imageView.superview;
     UIEdgeInsets padding = UIEdgeInsetsMake(60, 0, self.view.frame.size.height*2/3, 0);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superview).with.insets(padding);
    }];
    
    //button 在它下面20,左右50,下面self.view.frame.size.height*2/3-20
    UIEdgeInsets  padding1=UIEdgeInsetsMake(40, 50, self.view.frame.size.height*2/3-60, 50);
    UIButton*btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"我在这" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).with.offset(padding1.top);
        make.left.equalTo(btn1.superview.mas_left).with.offset(padding1.left);
        make.bottom.equalTo(btn1.superview.mas_bottom).with.offset(-padding1.bottom);
        make.right.equalTo(btn1.superview.mas_right).with.offset(-padding1.right);
    }];
    
   // label 水平垂直居中 高度等于btn1
    UILabel*label=[[UILabel alloc]init];
    [self.view addSubview:label];
    label.backgroundColor=[UIColor redColor];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(label.superview.mas_centerX);
        make.centerY.equalTo(label.superview.mas_centerY);
        make.height.with.offset(40);
        make.width.equalTo(btn1.mas_width);
    }];
    
    //textField 等于labe的size.距离label.buttom 40
    UITextField*textfield=[[UITextField alloc]init];
    textfield.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:textfield];
    [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(label);
        make.top.equalTo(label.mas_bottom).with.offset(40);
        make.centerX.equalTo(label.mas_centerX);
    }];
    
   
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
