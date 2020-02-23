//
//  runloopObj.m
//  LiRWTool
//
//  Created by  RWLi on 2020/2/23.
//  Copyright © 2020  RWLi. All rights reserved.
//

#import "runloopObj.h"

@interface runloopObj  ()
@property(nonatomic,strong)NSMutableArray  *tasks;
@end

@implementation runloopObj

CFRunLoopObserverRef ref;
CFRunLoopRef runloop;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addRunloop];
        _maxTskCount = 0;
    }
    return self;
}
-(instancetype)initWithMaxTaskCount:(NSInteger)count{
    
    if (self = [super init]) {
         [self addRunloop];
        _maxTskCount = count;
    }
    return self;
}

-(void)addRunloop{
    
//    CFRunLoopAddTimer(<#CFRunLoopRef rl#>, <#CFRunLoopTimerRef timer#>, <#CFRunLoopMode mode#>)
//    CFRunLoopAddSource(<#CFRunLoopRef rl#>, <#CFRunLoopSourceRef source#>, <#CFRunLoopMode mode#>)
//    CFRunLoopAddObserver(<#CFRunLoopRef rl#>, <#CFRunLoopObserverRef observer#>, <#CFRunLoopMode mode#>)
    
    runloop = CFRunLoopGetCurrent();
    CFRunLoopObserverContext contex =
    {
        0,
        (__bridge void *)self,
        &CFRetain,
        &CFRelease,
        NULL
    };
    
//   typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
//        kCFRunLoopEntry = (1UL << 0),
//        kCFRunLoopBeforeTimers = (1UL << 1),
//        kCFRunLoopBeforeSources = (1UL << 2),
//        kCFRunLoopBeforeWaiting = (1UL << 5),
//        kCFRunLoopAfterWaiting = (1UL << 6),
//        kCFRunLoopExit = (1UL << 7),
//        kCFRunLoopAllActivities = 0x0FFFFFFFU
//    };
    
    ref = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting, YES, 0, &callback, &contex);
    CFRunLoopAddObserver(runloop, ref, kCFRunLoopCommonModes);
    CFRelease(ref);
}

//typedef void (*CFRunLoopObserverCallBack)(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info);
void callback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    runloopObj *obj = (__bridge runloopObj*)info;
    if (obj && [obj isKindOfClass:NSClassFromString(@"runloopObj")]) {
        [obj excuFirstTask];
    }
    
    
}




-(void)addTask:(operation)block{
    
    @synchronized (self) {
        if (!_tasks) {
            _tasks = [NSMutableArray array];
        }
        
        
        if (_tasks.count > _maxTskCount) {
            [_tasks removeObjectAtIndex:0];
        }

        [_tasks addObject:block];
        
    }
    
    
    
}


-(void)excuFirstTask{
    
    @synchronized (self) {
        if (_tasks.count) {
            operation block = _tasks.firstObject;
            sleep(0.5);
            if (block) {
                block();
                [_tasks removeObjectAtIndex:0];
            }
        }
    }
    
    
    
}

-(void)removeRunloop{
     CFRunLoopRemoveObserver(runloop, ref, kCFRunLoopCommonModes);
    
}

-(void)dealloc{
    
   
}

@end
