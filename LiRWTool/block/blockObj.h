//
//  blockObj.h
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "blockManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface blockObj : NSObject

+(int)excuAddWithBlock:(void(^)(blockManager* manager))block;

@end

NS_ASSUME_NONNULL_END
