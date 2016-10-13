//
//  ViewController.m
//  推送
//
//  Created by Apple on 16/10/13.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIMutableUserNotificationAction*action=[[UIMutableUserNotificationAction alloc]init];
    action.title=@"动作标题";
    action.activationMode=UIUserNotificationActivationModeBackground;
    action.destructive=YES;//消极的
    action.authenticationRequired=YES;//需要证明
    //UIUserNotificationCategory
    UIMutableUserNotificationCategory*categoy=[[UIMutableUserNotificationCategory alloc]init];
    NSArray*array=[NSArray arrayWithObject:action];
    [categoy setActions:array forContext:UIUserNotificationActionContextDefault];
    
    
    NSSet*set1 =[NSSet setWithObjects:categoy, nil];
    UIUserNotificationSettings*set =[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert categories:set1];
    [[UIApplication sharedApplication]registerUserNotificationSettings:set];
    //创建本地通知 特定的时间或事件显示出来
    UILocalNotification*local = [[UILocalNotification alloc]init];
//    /初始化
    local.alertBody=@"女神:202";
    local.alertAction=@"123";
    local.alertLaunchImage=@"";
    local.fireDate=[NSDate dateWithTimeIntervalSinceNow:5];
    local.applicationIconBadgeNumber=10;
    local.userInfo=@{@"weq":@"323"};
    //添加
//    [self.view addSubview:local];
    
    [[UIApplication sharedApplication]scheduleLocalNotification:local];
    // Do any additional setup after loading the view, typically from a nib.
    //知道什么时候接受了通知
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
