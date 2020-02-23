//
//  getVar.h
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface getVar : NSObject

@property(nonatomic,copy)NSString*  year;
@property(nonatomic,copy)NSString*  month;
@property(nonatomic,copy)NSString*  day;
@property(nonatomic,assign)int  money;


+(void)getvar;

@end

NS_ASSUME_NONNULL_END
