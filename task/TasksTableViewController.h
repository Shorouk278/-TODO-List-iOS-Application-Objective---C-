//
//  FriendsTableViewController.h
//  task
//
//  Created by shorouk mohamed on 12/10/19.
//  Copyright © 2019 shorouk mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "AddTaskViewController.h"
#import "AddTaskProtocol.h"
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface TasksTableViewController : UIViewController <AddTaskProtocol,UIPickerViewDataSource, UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *taskTableView;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

    
@property (weak, nonatomic) IBOutlet UITabBarItem *doneItem;

@property (weak, nonatomic) IBOutlet UITabBar *tabBar;





@end

NS_ASSUME_NONNULL_END
