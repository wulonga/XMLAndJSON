//
//  ViewController.m
//  使用kissxml解析xml
//
//  Created by mac on 2018/7/23.
//  Copyright © 2018年 Gooou. All rights reserved.
//

#import "ViewController.h"
#import "BooksParser.h"
#import "Message.h"

@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BooksParser *booksparser=[[BooksParser alloc]init];
    NSArray *array=[booksparser parseXml:@"books"];
    NSLog(@"Array的值为%@",array);
    
    //以下为使用json案例
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"date_JSON" ofType:@"txt"];
    //将文件导入data
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    //使用json解析
    NSArray *array2=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    //初始化数组
    self.dataArray=[NSMutableArray array];
    //将得到的数据赋值给对象，并放入数组
    for (NSDictionary *d in array2) {
        Message *m=[[Message alloc]init];
        [m setValuesForKeysWithDictionary:d];
        [self.dataArray addObject:m];//KVC操作
    }
    //显示解析得到的文档
    for (Message *m in self.dataArray) {
        NSLog(@"\n");
        NSLog(@"sender:%@",m.sender);
        NSLog(@"receiver:%@",m.receiver);
        NSLog(@"content:%@",m.content);
        NSLog(@"date:%@",m.date);
    }
}



@end











