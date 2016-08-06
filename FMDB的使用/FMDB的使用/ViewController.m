//
//  ViewController.m
//  FMDB的使用
//
//  Created by Apple on 16/8/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"
#import <sqlite3.h>
#import <sqlite3_private.h>
#import <sqlite3ext.h>
#define FMDBQuickCheck(SomeBool) { if (!(SomeBool)) { NSLog(@"Failure on line %d", __LINE__); abort(); } }
@interface ViewController ()
@property(nonatomic,strong)FMDatabase*dataBase;
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //FMDB 是使用  增删改查
    //获取路径数组
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取路径
    NSString *documentDirectory = [paths objectAtIndex:0];
    //dbPath： 数据库路径，在Document中。
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"Test.db"];
    NSLog(@"%@",dbPath);
    //创建db对象
    FMDatabase *db= [FMDatabase databaseWithPath:dbPath] ;
    if (![db open]) {
        NSLog(@"Could not open db.");
        return ;
    }
    //创建表和类型
    [db executeUpdate:@"CREATE TABLE  IF NOT EXISTS User (id integer PRIMARY KEY autoincrement , Name text, Age integer)"];
//    NSLog(@"%@",[db lastError]);
//   NSLog(@"%@",[db lastErrorMessage]);
    //增加数据
    [db executeUpdate:@"INSERT INTO User (Name,Age) VALUES (?,?)",@"老婆",[NSNumber numberWithInt:20]] ;
    //更改数据
    [db executeUpdate:@"UPDATE User SET Name = ? WHERE Name = ? ",@"宝贝",@"老婆"];
    //删除数据
//    [db executeUpdate:@"DELETE FROM User WHERE Name = ?",@"宝贝"];
    //查询数据  //只能查询一条
    NSString *aa=[db stringForQuery:@"SELECT Name FROM User WHERE Age = ?",@"20"];
    NSLog(@"%@",aa);
    //查询所有符合的数据
   FMResultSet*rs=[db executeQuery:@"SELECT * FROM User WHERE Age = ?",@"20"];
    while ([rs next])//指向下一个,判断是否有值
    {
        NSLog(@"%@ %@",[rs stringForColumn:@"Name"],[rs stringForColumn:@"Age"]);
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
