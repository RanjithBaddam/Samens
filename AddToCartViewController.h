//
//  AddToCartViewController.h
//  samens
//
//  Created by All time Support on 30/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginDetailsModel.h"


@interface AddToCartViewController : UIViewController
@property(nonatomic,weak)IBOutlet UIScrollView *scrollView;

@property(nonatomic,weak)IBOutlet UILabel *MyCartListNumLabel;
@property(nonatomic,weak)IBOutlet UILabel *pincodeLabel;
-(IBAction)ClickOnChangePincode:(id)sender;
@property(nonatomic,weak)IBOutlet UITableView *AddToCartTableView;
@property(nonatomic,weak)IBOutlet UITableView *PriceDetailsTableView;

@property(nonatomic,strong)LoginDetailsModel *loginModel;
@property(nonatomic,strong)NSMutableArray *loginDetailsArray;
@property(nonatomic,strong)NSString *pid;
@property(nonatomic,weak)IBOutlet UIView *QuantityPopUpView;



@end
