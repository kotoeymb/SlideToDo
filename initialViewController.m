//
//  initialViewController.m
//  SlideToDo
//
//  Created by Revo Tech on 6/21/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import "initialViewController.h"

@interface initialViewController ()

@end

@implementation initialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TodoView"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
