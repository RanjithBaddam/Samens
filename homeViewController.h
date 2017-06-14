//
//  homeViewController.h
//  samens
//
//  Created by All time Support on 07/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeViewController : UIViewController
@property(nonatomic,weak)IBOutlet UIScrollView *scrollView;
@property(nonatomic,weak)IBOutlet UICollectionView *collectionView;
@property(nonatomic,weak)IBOutlet UICollectionView *pageCollectionView;
@property(nonatomic,weak)IBOutlet UITableView *catogorysTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *catogorysTblHeight;
@property(nonatomic,strong)NSMutableArray *mainArray;
@property(nonatomic,strong)NSMutableArray *productMainArray;




@end
