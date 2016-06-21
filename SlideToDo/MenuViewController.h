//
//  MenuViewController.h
//  SlideToDo
//
//  Created by Revo Tech on 6/21/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MenuViewControllerDelegate;
@interface MenuViewController : UIViewController
@property (nonatomic, weak) id <MenuViewControllerDelegate> delegate;
@property (nonatomic, strong) NSArray *categoryList;

@end


 @protocol MenuViewControllerDelegate

-(void)menuViewControllerDidFinishWithCategoryId:(NSInteger)categoryId;

@end
