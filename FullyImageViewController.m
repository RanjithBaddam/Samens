//
//  FullyImageViewController.m
//  samens
//
//  Created by All time Support on 16/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "FullyImageViewController.h"
#import "FullImageViewCollectionViewCell.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>

@interface FullyImageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSString *image;
    NSString *image2;
    NSString *image3;
    NSString *image4;
    NSMutableArray *fullImageViewArray;

}
@end

@implementation FullyImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    fullImageViewArray = [[NSMutableArray alloc]initWithObjects:image,image2,image3,image4, nil];
    NSLog(@"%@",fullImageViewArray);
    self.fullImageCollectionView.delegate = self;
    self.fullImageCollectionView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return fullImageViewArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FullImageViewCollectionViewCell *cell = [_fullImageCollectionView dequeueReusableCellWithReuseIdentifier:@"FullImageViewCollectionViewCell" forIndexPath:indexPath];
    if (indexPath.section==0) {
   [cell.fullImageView setImageWithURL:[fullImageViewArray objectAtIndex:indexPath.item] placeholderImage:nil];
    }else if (indexPath.section==1){
        [cell.fullImageView setImageWithURL:[fullImageViewArray objectAtIndex:indexPath.item] placeholderImage:nil];
 
    }else{
        [cell.fullImageView setImageWithURL:[fullImageViewArray objectAtIndex:indexPath.item] placeholderImage:nil];
    }
  
    
    return cell;
}
-(void)getFullImage:(NSString *)Image{
    image = Image;
    image2 = Image;
    image3 = Image;
    image4 = Image;
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
