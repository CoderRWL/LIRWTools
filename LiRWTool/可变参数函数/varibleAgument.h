//
//  varibleAgument.h
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface varibleAgument : NSObject

/*
第一个参数一定要传
NS_REQUIRES_NIL_TERMINATION 提示编译器，最后一个参数必须传nil
 参数类型要固定，不能乱传，
 */
+(void)varibleWithObj:(int)num,...NS_REQUIRES_NIL_TERMINATION;

@end

NS_ASSUME_NONNULL_END
