//
//  getVar.m
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import "getVar.h"
#import <objc/runtime.h>

@implementation getVar


+(void)getvar{
    
    unsigned int count;
    Ivar *ivars = class_copyIvarList([self class], &count);//cout 参数个数
    
    while (count-- > 0) {
        const char *name = ivar_getName(ivars[count]);
        if (strlen(name)) {
            NSString *varName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            DLog(@"成员变量--%@",varName);
        }
        
    }
    
    
}

@end
