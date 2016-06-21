//
//  TodoController.m
//  SlideToDo
//
//  Created by Revo Tech on 6/21/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "TodoController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@interface TodoController ()<UITableViewDataSource, UITableViewDelegate, MenuViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *Menu;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UINavigationItem *navigationTitle;
@property (nonatomic, strong) NSArray *toDoCategories;
@property (nonatomic, assign) NSInteger selectedCategory;

@end

@implementation TodoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *choresDictionary = @{@"title": @"Chores",
                                       @"items": @[@"Sweep", @"Dishes", @"Mow the lawn"]};
    NSDictionary *workDictionary = @{@"title": @"Work",
                                     @"items": @[@"TPS Report"]};
    NSDictionary *groceryDictionary = @{@"title": @"Grocery List",
                                        @"items": @[@"Chips", @"Salsa", @"Fruit snacks", @"Beer"]};

 //    [self.slidingViewController setAnchorRightRevealAmount:350.0f];
 //    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    self.toDoCategories = @[choresDictionary, workDictionary, groceryDictionary];
    self.selectedCategory = 0;
    self.Menu.title = self.toDoCategories[self.selectedCategory][@"Menu"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Add a shadow to the top view so it looks like it is on top of the others
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    // Tell it which view should be created under left
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuView"];
        [(MenuViewController *)self.slidingViewController.underLeftViewController setCategoryList:self.toDoCategories];
        [(MenuViewController *)self.slidingViewController.underLeftViewController setDelegate:self];
    }
    
    // Add the pan gesture to allow sliding
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Tableview DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *currentCategory = self.toDoCategories[self.selectedCategory];
    return [currentCategory[@"items"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *currentCategory = self.toDoCategories[self.selectedCategory];
    cell.textLabel.text = currentCategory[@"items"][indexPath.row];
    
    return cell;
}

#pragma mark - MenuViewController Delegate

- (void)menuViewControllerDidFinishWithCategoryId:(NSInteger)categoryId
{
    self.selectedCategory = categoryId;
    self.navigationTitle.title = self.toDoCategories[self.selectedCategory][@"title"];
    [self.tableView reloadData];
    [self.slidingViewController resetTopView];
}

@end
