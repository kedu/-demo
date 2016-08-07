//
//  ViewController.m
//  game-kit
//
//  Created by Apple on 16/8/7.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import <GameKit/GameKit.h>
@interface ViewController ()<GKPeerPickerControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
/**
 *  显示图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *showImg;

/*
 *  保存当前回话
 */
@property (nonatomic, strong) GKSession *session;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - delegate
/*
 * 连接蓝牙的方式    附近    在线
 */
- (void)peerPickerController:(GKPeerPickerController *)picker didSelectConnectionType:(GKPeerPickerConnectionType)type {
    NSLog(@"%s  %d  type =%lu  picker %@",__func__,__LINE__,(unsigned long)type,picker);
}

// 连接会话的方式   附近  在线
- (GKSession *)peerPickerController:(GKPeerPickerController *)picker sessionForConnectionType:(GKPeerPickerConnectionType)type {
    
    return nil;
}

/* 连接成功
 *  peerID  连接成功的设备id
 *  session  当前回话  只需要保存当前的会话  即 可 数据传递
 */
- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session {
    
    // 隐藏选择器
    [picker dismiss];
    
    // 接收数据的回调  GameKIt  必须实现的
    [session setDataReceiveHandler:self withContext:nil];
    
    // 保存会话
    self.session = session;
}

// 只要有数据回来  那么就会调用
- (void) receiveData:(NSData *)data fromPeer:(NSString *)peer inSession: (GKSession *)session context:(void *)context
{
    //    if (!data) return;
    // 转换图片
    UIImage *img = [UIImage imageWithData:data];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.showImg.image = img;
    });
}

/*
 *  退出
 */
- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker
{
    
}

#pragma mark - imageDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    self.showImg.image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 按钮的点击
- (IBAction)connect:(id)sender {
    // 创建蓝牙选择器
    GKPeerPickerController *picker = [[GKPeerPickerController alloc]init];
    picker.delegate = self;
    // 显示
    [picker show];
}

- (IBAction)selectImg:(id)sender {
    //创建图片选择器
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc]init];
    imgPicker.delegate = self;
    imgPicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:imgPicker animated:YES completion:nil];
    
}
- (IBAction)sendImg:(id)sender {
    if (!self.showImg.image) return;
    //图片转化
    NSData *data = UIImagePNGRepresentation(self.showImg.image);
    
    //    GKSendDataReliable  安全模式
    //    GKSendDataUnreliable 不安全模式
    [self.session sendDataToAllPeers:data withDataMode:GKSendDataUnreliable error:nil];
    
    NSLog(@"session  =  %@" , self.session);
}
@end

