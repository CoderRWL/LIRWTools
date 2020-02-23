//
//  blockManager.m
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import "blockManager.h"

@interface blockManager ()
@property(nonatomic,assign)int  sum;
@end
@implementation blockManager


-(manager)add{
    
    
    __weak typeof(self) wkself = self;
    return ^blockManager*(int num){
        wkself.sum += num;
        return self;
        
    };
}

-(int)getSum{
    
    return _sum;
}

@end
