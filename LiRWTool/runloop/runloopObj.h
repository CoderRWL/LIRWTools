//
//  runloopObj.h
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^operation)(void);

@interface runloopObj : NSObject


@property(nonatomic,assign)NSInteger  maxTskCount;
-(instancetype)initWithMaxTaskCount:(NSInteger)count;

-(void)addTask:(operation)block;

-(void)removeRunloop;

@end

NS_ASSUME_NONNULL_END
