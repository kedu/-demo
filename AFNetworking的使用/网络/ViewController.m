//
//  ViewController.m
//  网络
//
//  Created by Apple on 16/8/5.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     //download
    [self down];
}
-(void)down{


    //创建url
    NSURL *URL = [NSURL URLWithString:@"http://example.com/download.zip"];
    //创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    //获取NSURLSessionConfiguration
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //创建管理
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    //创建task
    /**
     *  创建task
     *
     *  @param targetPath 放哪
     *  @param response   请求回来的数据
     *
     *  @return return 返回filePath
     */
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
    NSLog(@"%@",response);
    return [NSURL URLWithString:@"123"];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
    NSLog(@"我完成了,在%@",filePath);}
                                              ];
    //执行任务
    [downloadTask resume];



}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
