//
//  blockObj.m
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import "blockObj.h"

@implementation blockObj

+(int)excuAddWithBlock:(void(^)(blockManager * _Nonnull))block{
    
    blockManager *m =[[blockManager alloc]init];
    block(m);
    return [m getSum];
}

@end
