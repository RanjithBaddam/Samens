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

@interface SubSubViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSString *subsubCatId;
}

@end

@implementation SubSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getId:(NSString *)CategoryId{
    NSLog(@"%@",CategoryId);
    subsubCatId = CategoryId;
    NSLog(@"%@",subsubCatId);

}

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//
//    return 3;
//}
//- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    FullViewCollectionViewCell *cell = [_fullViewCollectionView dequeueReusableCellWithReuseIdentifier:@"FullViewCollectionViewCell" forIndexPath:indexPath];
//    ItemsDisplayViewController *itemVc = [[ItemsDisplayViewController alloc]init];
//    
//    if (indexPath.item) {
//        SubCategoryModel *model = [itemVc valueForKey:@"image2"];
//           [self getId:subsubCatId];
//        [cell.fullViewImage setImageWithURL:[NSURL URLWithString:model.image2] placeholderImage:nil];
//     
//        
//    }else if (indexPath.item){
//        SubCategoryModel *model = [itemVc valueForKey:@"image3"];
//
//         [self getId:subsubCatId];
//         [cell.fullViewImage setImageWithURL:[NSURL URLWithString:model.image3] placeholderImage:nil];
//       
//    }else{
//        SubCategoryModel *model = [itemVc valueForKey:@"image3"];
//
//          [self getId:subsubCatId];
//        [cell.fullViewImage setImageWithURL:[NSURL URLWithString:model.image4] placeholderImage:nil];
//      
//    }
//    
//    return cell;
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
