//
//  SubSubViewController.h
//  samens
//
//  Created by All time Support on 11/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubCategoryModel.h"

@interface SubSubViewController : UIViewController
-(void)getId:(NSString *)CategoryId;
@property(nonatomic,weak)IBOutlet UICollectionView *fullViewCollectionView;
@property(nonatomic,strong)SubCategoryModel *subsubCatModel;

@end
