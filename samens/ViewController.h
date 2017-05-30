//
//  ViewController.h
//  samens
//
//  Created by All time Support on 30/05/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pageContentViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate,UIPageViewControllerDataSource>
@property (nonatomic,strong) UIPageViewController *PageViewController;
@property (nonatomic,strong) NSArray *arrPageImages;
- (pageContentViewController *)viewControllerAtIndex:(NSUInteger)index;
@end

