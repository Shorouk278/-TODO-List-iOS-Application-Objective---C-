//
//  AddFriendViewController.m
//  task
//
//  Created by shorouk mohamed on 12/13/19.
//  Copyright © 2019 shorouk mohamed. All rights reserved.
//

#import "AddTaskViewController.h"
#import "Task.h"
#import "TasksTableViewController.h"

@interface AddTaskViewController ()
{

    NSArray *_pickerData;
    UIImage *Image;
    
    
}

@end

@implementation AddTaskViewController

- (IBAction)segmentDidTapped:(id)sender {
    
    if ([sender selectedSegmentIndex] == 0)
    {
        
    printf("toDo");
        tempTask.status = @"todo";
        
        
    }else if([sender selectedSegmentIndex] == 2) {
        
        printf("done");
         tempTask.status = @"done";
    } else if ([sender selectedSegmentIndex] == 1){
        // [_myProtocol addTask : tempTask];
        printf("inprog");
         tempTask.status = @"inprog";
    }
    
}



- (IBAction)editButton:(id)sender {
    tempTask.fName= _addTheName.text ;
    tempTask.desc = _addDesc.text;
    [_myProtocol editTask : tempTask];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addButton:(id)sender {
    
   // Task *tTask = [Task new];
    tempTask.fName= _addTheName.text ;
    tempTask.desc = _addDesc.text;
    [_myProtocol addTask : tempTask];
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)segmentAction:(id)sender {
   
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _pickerData = @[@"High", @"Mid", @"Low"];
    self.picker.dataSource = self;
    self.picker.delegate = self;
}


-(void)viewWillAppear:(BOOL)animated
{
    tempTask = [Task new];
    [super viewWillAppear: animated];
    _addTheName.text = @"" ;
    _addDesc.text = @"";
    
    
}
// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}
// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    switch (row) {
        case 0:
            Image = [UIImage imageNamed: @"high.jpg"];
            tempTask.taskImage = Image;
            printf("high");

            break;
        case 1:
            Image = [UIImage imageNamed: @"mid.jpg"];
            tempTask.taskImage = Image;
            printf("mid");
            break;
        case 2:
            Image = [UIImage imageNamed: @"low.jpg"];
            tempTask.taskImage = Image;
            printf("low");
            break;
        default:
            break;
    }
    
}


@end
