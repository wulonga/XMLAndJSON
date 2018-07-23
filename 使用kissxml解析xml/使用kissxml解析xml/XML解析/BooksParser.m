//
//  BooksParser.m
//  使用kissxml解析xml
//
//  Created by mac on 2018/7/23.
//  Copyright © 2018年 Gooou. All rights reserved.
//

#import "BooksParser.h"
#import "DDXMLDocument.h"
@implementation BooksParser
-(NSArray<Books*>*)parseXml:(NSString*)xmlName
{
    //使用NSBundle对象获取到需要解析的xml文档的路径
    NSString *path=[[NSBundle mainBundle]pathForResource:xmlName ofType:@"xml"];
    //使用NSFileHandle对象根据文件路径获取文件
    NSFileHandle *file=[NSFileHandle fileHandleForReadingAtPath:path];
    NSData *data=[file readDataToEndOfFile];
    //根据NSData对象初始化DDXMLDocument对象
    DDXMLDocument *doc=[[DDXMLDocument alloc]initWithData:data options:0 error:nil];
    //获取元素。也就是<books.../>元素
    DDXMLElement *rootElement=[doc rootElement];
    //获取所有的<book../>元素的集合
    NSArray *bookElements=[rootElement elementsForName:@"book"];
    //初始化一个可变数组，用于存储获取到的<book../>元素的内容
    NSMutableArray *books=[[NSMutableArray alloc]init];
    //遍历book中的所有元素
    for (DDXMLElement *bookElement in bookElements) {
        Books *book=[[Books alloc]init];
        NSString *title=[[bookElement elementsForName:@"title"][0] stringValue];
        NSString *author=[[bookElement elementsForName:@"author"][0] stringValue];
        NSString *remark=[[bookElement elementsForName:@"remark"][0] stringValue];
        book.title=title;
        book.author=author;
        book.remark=remark;
        [books addObject:book];
    }
    return books;
}
@end
