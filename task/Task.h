//
//  Friend.h
//  task
//
//  Created by shorouk mohamed on 12/10/19.
//  Copyright © 2019 shorouk mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject<NSCoding>
@property NSString *fName;
@property NSString *desc;
@property UIImage *taskImage;
@property NSString *status;




@end

NS_ASSUME_NONNULL_END
