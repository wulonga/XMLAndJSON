//
//  Message.h
//  使用kissxml解析xml
//
//  Created by mac on 2018/7/23.
//  Copyright © 2018年 Gooou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject
@property(nonatomic,copy)NSString *sender;
@property(nonatomic,copy)NSString *receiver;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *date;
@end
