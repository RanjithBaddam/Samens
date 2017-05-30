//
//  pageContentViewController.h
//  samens
//
//  Created by All time Support on 30/05/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pageContentViewController : UIViewController
@property  NSUInteger pageIndex;
@property  NSString *imgFile;
@property(nonatomic,weak)IBOutlet UIImageView *pageImgView;
@end
