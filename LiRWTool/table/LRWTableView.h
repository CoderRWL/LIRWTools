//
//  LRWTableView.h
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NSInteger (^intByIndexpath)(NSIndexPath * _Nonnull);
typedef NSInteger (^returnSection)(void);
typedef NSInteger (^intBySection)(NSInteger section);
typedef UITableViewCell * _Nonnull (^cellByIndexpath)(NSIndexPath * _Nonnull);
typedef void(^didSelectIndexpath)(NSIndexPath * _Nonnull);


@interface LRWTableView : UITableView

-(void)setDataSourseWithHeight:(intByIndexpath)height
                nemberSections:(returnSection)sections
                    numberRows:(intBySection)rows
                          cell:(cellByIndexpath)cell
                     didselect:(didSelectIndexpath)didSelect;


@end

NS_ASSUME_NONNULL_END
