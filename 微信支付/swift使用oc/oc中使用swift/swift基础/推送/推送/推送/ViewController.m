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
//    UIMutableUserNotificationCategory*categoy=[[UIMutableUserNotificationCategory alloc]init];
//    categoy.identifier = @"hello";
//    /*
//     UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc]init];
//     action1.identifier = @"nihao111";
//     action1.title = @"好的000";
//     action1.activationMode = UIUserNotificationActivationModeBackground;
//     action1.authenticationRequired = NO;
//     action1.destructive = YES;
//     
//     
//     UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc]init];
//     action2.identifier = @"nihao222";
//     action2.title = @"不好000";
//     action2.activationMode = UIUserNotificationActivationModeBackground;
//     action2.authenticationRequired = NO;
//     action2.destructive = NO;
//     
//     //UIUserNotificationActionContextDefault 默认可以添加四个动作
//     [category setActions:@[action1,action2] forContext:UIUserNotificationActionContextDefault];
//     
//     NSSet *set = [NSSet setWithObjects:category, nil];
//     
//     UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge |UIUserNotificationTypeSound |UIUserNotificationTypeAlert  categories:set];
//     
//     [[UIApplication sharedApplication]registerUserNotificationSettings:setting];
//     */
//    UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc]init];
//    action1.identifier = @"nihao111";
//    action1.title = @"好的000";
//    action1.activationMode = UIUserNotificationActivationModeBackground;
//    action1.authenticationRequired = NO;
//    action1.destructive = YES;
//    
//    
//    UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc]init];
//    action2.identifier = @"nihao222";
//    action2.title = @"不好000";
//    action2.activationMode = UIUserNotificationActivationModeBackground;
//    action2.authenticationRequired = NO;
//    action2.destructive = NO;
//    //UIUserNotificationCategory
//
//    [categoy setActions:@[action1,action2] forContext:UIUserNotificationActionContextDefault];
//    
//    
//    NSSet*set1 =[NSSet setWithObjects:categoy, nil];
//    UIUserNotificationSettings*set =[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert categories:set1];
//    [[UIApplication sharedApplication]registerUserNotificationSettings:set];

//    // Do any additional setup after loading the view, typically from a nib.
//    //知道什么时候接受了通知
    
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc]init];
    
    //唯一标示
    category.identifier = @"hello";
    
    /*
     // The unique identifier for this action.
     @property (nullable, nonatomic, copy) NSString *identifier;
     
     // The localized title to display for this action.
     @property (nullable, nonatomic, copy) NSString *title; 标题
     
     @property (nonatomic, assign) UIUserNotificationActionBehavior behavior NS_AVAILABLE_IOS(9_0);
     
     // Parameters that can be used by some types of actions.
     @property (nonatomic, copy) NSDictionary *parameters NS_AVAILABLE_IOS(9_0);
     
     //枚举
     @property (nonatomic, assign) UIUserNotificationActivationMode activationMode;
     
     //按钮响应事件 的处理 是否需要打开APP
     UIUserNotificationActivationModeForeground, //程序前台 打开APP
     UIUserNotificationActivationModeBackground  //后台 陌陌的处理
     @property (nonatomic, assign, getter=isAuthenticationRequired) BOOL authenticationRequired;  是否解锁屏幕的BOOl
     
     // Whether this action should be indicated as destructive when displayed.
     //是否显示 红色字体
     @property (nonatomic, assign, getter=isDestructive) BOOL destructive;
     
     */
    //Action 动作
    UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc]init];
    action1.identifier = @"nihao111";
    action1.title = @"好的000";
    action1.activationMode = UIUserNotificationActivationModeBackground;
    action1.authenticationRequired = NO;
    action1.destructive = YES;
    
    
    UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc]init];
    action2.identifier = @"nihao222";
    action2.title = @"不好000";
    action2.activationMode = UIUserNotificationActivationModeBackground;
    action2.authenticationRequired = NO;
    action2.destructive = NO;
    
    //UIUserNotificationActionContextDefault 默认可以添加四个动作
    [category setActions:@[action1,action2] forContext:UIUserNotificationActionContextDefault];
    
    NSSet *set = [NSSet setWithObjects:category, nil];
    
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge |UIUserNotificationTypeSound |UIUserNotificationTypeAlert  categories:set];
    
    [[UIApplication sharedApplication]registerUserNotificationSettings:setting];
        //创建本地通知 特定的时间或事件显示出来
        UILocalNotification*local = [[UILocalNotification alloc]init];
    //    /初始化
        local.alertBody=@"女神:202";
        local.alertAction=@"123";
        local.alertLaunchImage=@"";
        local.fireDate=[NSDate dateWithTimeIntervalSinceNow:5];
        local.applicationIconBadgeNumber=10;
        local.userInfo=@{@"weq":@"323"};
    local.category = @"hello";
        //添加
        [[UIApplication sharedApplication]scheduleLocalNotification:local];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
