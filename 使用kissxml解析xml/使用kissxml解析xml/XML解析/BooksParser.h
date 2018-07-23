//
//  BooksParser.h
//  使用kissxml解析xml
//
//  Created by mac on 2018/7/23.
//  Copyright © 2018年 Gooou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Books.h"
@interface BooksParser : NSObject
-(NSArray<Books*>*)parseXml:(NSString*)xmlName;
@end
