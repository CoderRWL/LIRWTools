//
//  varibleAgument.m
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import "varibleAgument.h"



@implementation varibleAgument

+ (void)varibleWithObj:(int)num, ...{
    
    
    if (num > 0) {
        va_list ptr;
        va_start(ptr, num);//从num这个参数推算出可变参数列表的起始地址
        NSString *va;
        while ((va = va_arg(ptr, NSString*))) {//根据传的参数类型，推算出需要把偏移多少个字节
            //取出参数为nil时退出循环
            DLog(@"%@\n",va);
        }
        
        va_end(ptr);//清空指针
       
    }
    

    
}


@end
