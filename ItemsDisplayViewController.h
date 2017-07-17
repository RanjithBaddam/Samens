//
//  ItemsDisplayViewController.h
//  samens
//
//  Created by All time Support on 10/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryModel.h"
#import "homeViewController.h"
#import "LoginDetailsModel.h"
#import "SubCategoryModel.h"

@interface ItemsDisplayViewController : UIViewController
@property(nonatomic,weak)IBOutlet UICollectionView *DisplayItemsCollectionView;
-(void)getId:(NSString *)CategoryId;
-(void)getName:(NSString *)CategoryName;
-(void)getPopUpName:(NSString *)popUpName;
-(IBAction)ClickOnFilter:(id)sender;
@property(nonatomic,weak)IBOutlet UITableView *sortTableView;
@property(nonatomic,weak)IBOutlet UILabel *titleLabel;
@property(nonatomic,strong)NSMutableArray *subCatMainData;
@property(nonatomic,strong)NSMutableArray *subimageMainData;
@property(nonatomic,weak)IBOutlet UIView *sortPopUpView;
@property(nonatomic,weak)IBOutlet UIButton *sortButton;
@property(nonatomic,weak)IBOutlet UIButton *filterButton;
-(void)getSortId:(NSString *)SortItemId;
@property(nonatomic,weak)IBOutlet UILabel *popUpTextLabel;
-(void)getPrice:(NSString *)price;
-(void)getPid:(NSString *)Pid;


-(IBAction)ClickOnSort1:(id)sender;
-(IBAction)ClickOnFilter1:(id)sender;

@property(nonatomic,strong)NSMutableArray *loginDetailsArray;
@property(nonatomic,strong)LoginDetailsModel *loginModel;
@property(nonatomic,strong)SubCategoryModel *subModel;



@end
