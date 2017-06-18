//
//  ItemsDisplayViewController.h
//  samens
//
//  Created by All time Support on 10/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryModel.h"

@interface ItemsDisplayViewController : UIViewController
@property(nonatomic,weak)IBOutlet UISearchBar *searchBar;
@property(nonatomic,weak)IBOutlet UICollectionView *DisplayItemsCollectionView;
-(void)getId:(NSString *)CategoryId;
-(void)getName:(NSString *)CategoryName;
-(IBAction)ClickOnSort:(id)sender;
-(IBAction)ClickOnFilter:(id)sender;
@property(nonatomic,weak)IBOutlet UITableView *sortTableView;
@property(nonatomic,weak)IBOutlet UILabel *titleLabel;
@property(nonatomic,weak)IBOutlet UILabel *popupTitleLabel;
@property(nonatomic,strong)NSMutableArray *subCatMainData;
@property(nonatomic,strong)NSMutableArray *subimageMainData;
@property(nonatomic,weak)IBOutlet UIView *sortPopUpView;
@end
