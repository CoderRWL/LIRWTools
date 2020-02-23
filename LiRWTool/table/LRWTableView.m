//
//  LRWTableView.m
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import "LRWTableView.h"
#import "runloopObj.h"




@interface LRWTableView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)intByIndexpath  heightBlock;
@property(nonatomic,strong)returnSection  sectionBlock;
@property(nonatomic,strong)intBySection  rowBlock;
@property(nonatomic,strong)cellByIndexpath  cellBlock;
@property(nonatomic,strong)didSelectIndexpath  selectBlck;

@property(nonatomic,strong)runloopObj  *runloop;


@end

@implementation LRWTableView



-(void)setDataSourseWithHeight:(intByIndexpath )height
                nemberSections:(returnSection )sections
                    numberRows:(intBySection)rows
                          cell:(cellByIndexpath)cell
                     didselect:( didSelectIndexpath)didSelect
{
    self.delegate = self;
    self.dataSource = self;
    
    if (height) {
        _heightBlock = height;
    }
    if (sections) {
        _sectionBlock = sections;
    }
    if (rows) {
        _rowBlock = rows;
    }
    if (cell) {
        _cellBlock = cell;
    }
    if (didSelect) {
        _selectBlck = didSelect;
    }
    
     _runloop = [[runloopObj alloc]initWithMaxTaskCount:50];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (_sectionBlock) {
        return _sectionBlock();
    }
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_rowBlock) {
        return _rowBlock(section);
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_heightBlock) {
        return  _heightBlock(indexPath);
    }
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_cellBlock) {
       return _cellBlock(indexPath);
    }
    return nil;
    
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_selectBlck) {
        _selectBlck(indexPath);
    }
}



- (void)dealloc
{
    [_runloop removeRunloop];
    
}


@end
