//
//  AddFriendViewController.h
//  task
//
//  Created by shorouk mohamed on 12/13/19.
//  Copyright © 2019 shorouk mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTaskProtocol.h"
#import "TasksTableViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface AddTaskViewController : UIViewController <AddTaskProtocol,UIPickerViewDataSource, UIPickerViewDataSource>

{
     Task *tempTask;
    
}



@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;


@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property id <AddTaskProtocol> myProtocol;
@property (weak, nonatomic) IBOutlet UITextField *addTheName;

@property (weak, nonatomic) IBOutlet UITextField *addDesc;







@end

NS_ASSUME_NONNULL_END
