//
//  ViewController.m
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import "ViewController.h"
#import "varibleAgument.h"
#import "STD.hpp"
#import "getVar.h"
#import "blockObj.h"
#import "LRWTableView.h"
#import "runloopObj.h"


@interface ViewController ()

@property(nonatomic,strong) runloopObj *runloop;

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    DLog(@"test%d",10)
    
    [varibleAgument varibleWithObj:3,@"1",@"2",@"3", nil];
    
    char src[10] = "lirenwei";
    char dst[5];
    STD::strcpy_s(dst, src, sizeof(dst));
    DLog(@"%s",dst);
    STD::strcat_s(src, dst, sizeof(src));
    DLog(@"%s",src);
    [getVar getvar];
    
    
    //
   int sum =  [blockObj excuAddWithBlock:^(blockManager * _Nonnull manager) {
        manager.add(10).add(20).add(30);
    }];
    DLog(@"sum=%d",sum);
    
//    Weak(self);
//    Strong(self);
    
    
    LRWTableView *table = [[LRWTableView alloc]initWithFrame:CGRectMake(0, 0, 414, 736)];
    [self.view addSubview:table];

    
   
    
    _runloop = [[runloopObj alloc]initWithMaxTaskCount:20];
    
     Weak(table)
    Weak(self)
    [table setDataSourseWithHeight:nil
                    nemberSections:nil
                        numberRows:^NSInteger (NSInteger section) {
        return 100;
    } cell:^UITableViewCell * _Nonnull(NSIndexPath * indexp) {
        
        UITableViewCell * cell = [weaktable dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = [NSString stringWithFormat:@"[%ld]",(long)indexp.row];
        }else{
            [weakself.runloop addTask:^{
               cell.textLabel.text = [NSString stringWithFormat:@"[%ld]",(long)indexp.row];
            }];
            
        }
        
    
        return cell;
    }didselect:^(NSIndexPath * indexp) {
        UITableViewCell *cell = [weaktable cellForRowAtIndexPath:indexp];
        if (cell) {
            cell.backgroundColor = [UIColor redColor];
        }
    }];
    
    
 

    
    
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
     [_runloop removeRunloop];
    
}



@end
