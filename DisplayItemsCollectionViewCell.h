//
//  DisplayItemsCollectionViewCell.h
//  samens
//
//  Created by All time Support on 11/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayItemsCollectionViewCell : UICollectionViewCell
@property(nonatomic,weak)IBOutlet UIImageView *displayItemImage;
@property(nonatomic,weak)IBOutlet UILabel *displayItemTextLabel;

@end