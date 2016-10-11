//
//  AppDelegate.h
//  weixing_pay
//
//  Created by Apple on 16/10/11.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/*
 公众号支付:在微信内的商家页面上完成支付
 APP支付:在APP中，调起微信进行支付
 扫码支付:扫描二维码(包含PC网站)进行支付
 刷卡支付:用户展示条码，商户扫描后，完成支付__一般超市
 微信支付需要300审核费用 暂时不用
 */
@end

