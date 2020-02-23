//
//  blockManager.h
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class blockManager;
typedef blockManager* _Nonnull (^manager)(int num);

@interface blockManager : NSObject


/*
 lirw add/modify 20200223
 链式编程
 */



-(manager)add;


-(int)getSum;

@end

NS_ASSUME_NONNULL_END
