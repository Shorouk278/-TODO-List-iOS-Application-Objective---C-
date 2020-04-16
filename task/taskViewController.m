//
//  friendViewController.m
//  task
//
//  Created by shorouk mohamed on 12/10/19.
//  Copyright © 2019 shorouk mohamed. All rights reserved.
//

#import "taskViewController.h"
#import "Task.h"

@interface taskViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;



@end

@implementation taskViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
   
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    _nameLabel.text = _todo.fName;
    _descLabel.text = _todo.description;
  
    
}


@end

