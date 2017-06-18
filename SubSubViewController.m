//
//  SubSubViewController.m
//  samens
//
//  Created by All time Support on 11/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "SubSubViewController.h"
#import "FullViewCollectionViewCell.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import "SubCategoryModel.h"
#import "ItemsDisplayViewController.h"
#import "FullyImageViewController.h"

@interface SubSubViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
{
    NSString *subsubCatId;
    NSString *subimage;
    NSString *subimage1;
    NSString *subimage2;
    NSString *subimage3;
    NSMutableArray *subimageArray;

}

@end

@implementation SubSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getId:subsubCatId];
    [self getId:subimage];
    [self getId:subimage1];
    [self getId:subimage2];
    [self getId:subimage3];
    subimageArray = [[NSMutableArray alloc]initWithObjects:subimage,subimage1,subimage2,subimage3, nil];
    NSLog(@"%@",subimageArray);
    self.fullViewCollectionView.delegate = self;
    self.fullViewCollectionView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getId:(NSString *)CategoryId{
    NSLog(@"%@",CategoryId);
    subsubCatId = CategoryId;
    NSLog(@"%@",subsubCatId);
    subimage = CategoryId;
    NSLog(@"%@",subimage);
    subimage1 = CategoryId;
    subimage2 = CategoryId;
    subimage3 = CategoryId;

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return subimageArray.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    FullViewCollectionViewCell *cell = [_fullViewCollectionView dequeueReusableCellWithReuseIdentifier:@"FullViewCollectionViewCell" forIndexPath:indexPath];
    cell.imgScrollView.contentSize = CGSizeMake(412, 410);
    if (indexPath.section==0) {
        [cell.fullViewImage setImageWithURL:[NSURL URLWithString:[subimageArray objectAtIndex:indexPath.item]] placeholderImage:nil];
        
    }else if (indexPath.section==1){

        [cell.fullViewImage setImageWithURL:[NSURL URLWithString:[subimageArray objectAtIndex:indexPath.item]] placeholderImage:nil];
        
//        cell.imgScrollView.minimumZoomScale = 0.5;
//        cell.imgScrollView.maximumZoomScale=6.0;
//        
//        cell.imgScrollView.contentSize=CGSizeMake(1280, 960);
        
    }else if (indexPath.section==2){

        [cell.fullViewImage setImageWithURL:[NSURL URLWithString:[subimageArray objectAtIndex:indexPath.item]] placeholderImage:nil];
    }else{
        [cell.fullViewImage setImageWithURL:[NSURL URLWithString:[subimageArray objectAtIndex:indexPath.item]] placeholderImage:nil];
    }
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    FullyImageViewController *fullyImageVc = [self.storyboard instantiateViewControllerWithIdentifier:@"FullyImageViewController"];
    [self.navigationController pushViewController:fullyImageVc animated:YES];
    SubCategoryModel *model = [subimageArray objectAtIndex:indexPath.item];
    if (indexPath.section == 0) {
        [fullyImageVc getFullImage:model.image];

    }else if (indexPath)
    [fullyImageVc getFullImage:model.image];
    [fullyImageVc getFullImage:model.image2];
    [fullyImageVc getFullImage:model.image3];
    [fullyImageVc getFullImage:model.image4];


}










/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
