//
//  AddFriendProtocol.h
//  task
//
//  Created by shorouk mohamed on 12/13/19.
//  Copyright © 2019 shorouk mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AddTaskProtocol <NSObject>

-(void)addTask : (Task*) todo;
-(void)editTask : (Task*) todo;


@end

NS_ASSUME_NONNULL_END
