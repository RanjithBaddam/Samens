//
//  CatogorysTableViewCell.m
//  samens
//
//  Created by All time Support on 08/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "CatogorysTableViewCell.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import "CatProductModel.h"
#import "customProductCollectionViewCell.h"
#import "homeViewController.h"
#import "SubSubViewController.h"
#import "ViewController.h"
#import "IndivisualProductDetailsViewController.h"
#import "SubCategoryModel.h"



@implementation CatogorysTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake((self.contentView.frame.size.width/2)-3, (self.contentView.frame.size.width/2)-3);
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"%@",_catModel.product);
    return _catModel.product.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
customProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customProductCollectionViewCell" forIndexPath:indexPath];
    UIImageView *imgView = [cell.contentView viewWithTag:100];
    
    CatProductModel *product = _catModel.product[indexPath.row];
    [imgView setImageWithURL:[NSURL URLWithString:product.image] placeholderImage:nil];
    NSLog(@"%@",imgView);
  
    NSLog(@"%@",product.name);
    cell.productImageNameLabel.text = product.name;
    [cell.imageButton addTarget:self action:@selector(ClickOnImg) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    customProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customProductCollectionViewCell" forIndexPath:indexPath];
    NSLog(@"%@",indexPath);
    cell.imageButton.tag = indexPath.item;

}
-(void)ClickOnImg{
   IndivisualProductDetailsViewController *indivisualVc = [[IndivisualProductDetailsViewController alloc]initWithNibName:@"IndivisualProductDetailsViewController"  bundle:nil];
    
    SubCategoryModel *model = [[SubCategoryModel alloc]init];
    [indivisualVc getId:model.pid];
    
}
@end
