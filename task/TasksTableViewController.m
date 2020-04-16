//
//  FriendsTableViewController.m
//  task
//
//  Created by shorouk mohamed on 12/10/19.
//  Copyright © 2019 shorouk mohamed. All rights reserved.
//

#import "TasksTableViewController.h"
#import "taskViewController.h"
#import "AddTaskProtocol.h"
#import "AddTaskViewController.h"


@interface TasksTableViewController ()
{
    
    NSMutableArray *filteredTasks;
    NSMutableArray *myArray;
    NSMutableArray *doneArray;
    BOOL isFiltered;
    BOOL isDone;
    int flag;
    NSMutableArray *inProgressArray;
    
    
    
    NSMutableArray *tasks ;
    Task *t1 ;
    Task *t2 ;
    Task *addTs;
    UIImage *priorityImage;
    
    int indexOfRow;
    taskViewController *tvc;
    AddTaskViewController *tt;
    AddTaskViewController *task;
}

@end

@implementation TasksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isFiltered = false;
    isDone = false;
    self.searchBar.delegate = self;
    self.tabBar.delegate = self;
    
    
    
    tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"task"];
    tt = [self.storyboard instantiateViewControllerWithIdentifier:@"third"];
    [tt setMyProtocol:self];
    

    
    tasks = [NSMutableArray new];
  
    t1 = [Task new];
    t2 = [Task new];
    

    
    t1.fName = @"read book";
    t1.desc = @"science";
    t1.taskImage = [UIImage imageNamed: @"high.jpg"];
    t1.status = @"todo";
    
   
    
    t2.fName = @"walk";
    t2.desc = @"2km";
    t2.status = @"todo";
  
    
    t2.taskImage = [UIImage imageNamed: @"low.jpg"];

    [tasks addObject:t1];
    [tasks addObject:t2];
    
  filteredTasks = [[NSMutableArray alloc]init];
    
    myArray = [[NSMutableArray alloc]init];
    doneArray = [NSMutableArray new];
    inProgressArray = [NSMutableArray new];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:@"saveTasks"];

    if(data != nil){
    myArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [defaults synchronize];
    if (myArray != nil){
        tasks = myArray;
      [defaults synchronize];
    }
    }
    
    
    [self.taskTableView reloadData];

}




- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if([searchText  isEqual: @""]){
        isFiltered = false;
    }
    else
    {
        isFiltered = true;
       
        for (id ts in tasks)
        {
            NSRange nameRange = [[ts fName] rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound)
            {
                [filteredTasks addObject:ts];
                [_taskTableView reloadData];
            }
        }
        
        
    }
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isFiltered)
    {
        return filteredTasks.count;
    }
    else if(isDone)
    {
        return doneArray.count;
    }else{
        return tasks.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
    if(isFiltered)
    {
        cell.imageView.image = [[filteredTasks objectAtIndex: indexPath.row]taskImage];
        cell.textLabel.text = [[filteredTasks objectAtIndex: indexPath.row]fName];
        
    }else if(isDone)
    {
        cell.imageView.image = [[doneArray objectAtIndex: indexPath.row]taskImage];
        cell.textLabel.text = [[doneArray objectAtIndex: indexPath.row]fName];
    }
else
    {
    cell.imageView.image = [[tasks objectAtIndex: indexPath.row]taskImage];
    cell.textLabel.text = [[tasks objectAtIndex: indexPath.row]fName];
   
    }
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
              tvc.todo = [tasks objectAtIndex:indexPath.row];
            break;
            
        default:
          break;
    }
    [self.navigationController pushViewController:tvc
                                         animated:YES];
    
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *secTitle = @"" ;
    switch (section)
    {
        case 0:
            secTitle = @"ToDo";
            break;
      
        default:
            break;
    }
    return secTitle;
}



 - (IBAction)insertButton:(id)sender
{
 [self.navigationController pushViewController:tt animated:YES];
 
 }

//Protocol Methods
 
- (void)addTask:(Task *)todo

{
    [tasks addObject:todo];
    printf("%d",[tasks count]);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject: tasks];
    [defaults setObject:data forKey: @"saveTasks"];
    [defaults synchronize];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   indexOfRow = indexPath.row;
}

-(void)editTask:(Task *)todo
{
   [tasks replaceObjectAtIndex:indexOfRow withObject:todo];
    
}

//Table View //Edit //Delete

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Edit" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        

        [self.navigationController pushViewController:tt animated:YES];
        
    }];
    
    editAction.backgroundColor = [UIColor blueColor];

    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Delete"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        
       
        [self ->tasks removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    

    }];
    deleteAction.backgroundColor = [UIColor redColor];

    return @[deleteAction,editAction];
}


- (IBAction)doneItem:(id)sender {
   isDone = true;
    isFiltered = false;
    
    for (int i=0; i< tasks.count;i++)
    {
        if (  [[[tasks objectAtIndex:i] status]isEqualToString:@"done"] )
        {
            [doneArray addObject:[tasks objectAtIndex:i]];
            
        }
    }
    
    [_taskTableView reloadData];
    
    
}


@end


