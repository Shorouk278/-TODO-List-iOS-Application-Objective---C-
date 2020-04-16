//
//  Friend.m
//  task
//
//  Created by shorouk mohamed on 12/10/19.
//  Copyright © 2019 shorouk mohamed. All rights reserved.
//

#import "Task.h"

@implementation Task

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.fName forKey:@"fName"];
    [encoder encodeObject:self.desc forKey:@"desc"];
     [encoder encodeObject:self.status forKey:@"status"];
//     [encoder encodeObject:self.priority forKey:@"priority"];
    [encoder encodeObject:UIImagePNGRepresentation(self.taskImage) forKey:@"taskImage"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init])) {
        self.fName = [decoder decodeObjectForKey:@"fName"];
        self.desc = [decoder decodeObjectForKey:@"desc"];
         self.status = [decoder decodeObjectForKey:@"status"];
//         self.priority = [decoder decodeObjectForKey:@"priority"];
        self.taskImage = [UIImage imageWithData:[decoder decodeObjectForKey:@"taskImage"]];
       
    }
    return self;
}
@end
