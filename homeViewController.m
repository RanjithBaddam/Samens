//
//  homeViewController.m
//  samens
//
//  Created by All time Support on 07/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "homeViewController.h"
#import "imageCatagory.h"
#import "ItemsCollectionViewCell.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import "CategoryModel.h"
#import "CatProductModel.h"
#import "CatogorysTableViewCell.h"
#import "pageSlideCollectionViewCell.h"
#import "ItemsDisplayViewController.h"
#import "SubCategoryModel.h"




@interface homeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray *allSlideImageArray;
    
    UIActivityIndicatorView *imageActivity;
    
    NSMutableArray *pageArrayData;
    NSTimer *timer;
    NSInteger currentAnimationIndex;
    
}
@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2000);
    timer = [[NSTimer alloc]init];
//    UIImage *image = [UIImage imageNamed:@"Applogo"];
//    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];

    allSlideImageArray = [[NSMutableArray alloc]init];
    _mainArray = [[NSMutableArray alloc]init];
    [self getAnimationImages];
    
    [self getcatagory];
    
    imageActivity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
   
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 3000);
    
    
}


-(void)getAnimationImages{
    NSDictionary *headers = @{ @"catagory_id": @"catagory_id",
                               @"cache-control": @"no-cache",
                               @"postman-token": @"1508bc44-9828-16e6-258a-472db435fa2f" };
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/fetch_slider_image.php"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:20.0];
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                        id SliderImageData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                        NSLog(@"%@",SliderImageData);
                                                        pageArrayData = [[NSMutableArray alloc]init];
                                                        
                                                        NSLog(@"%@",pageArrayData);
                                                        
                                                        NSArray *dummyCatArray = [SliderImageData objectForKey:@"categories"];
                                                        int index;
                                                        
                                                        for (index = 0; index < dummyCatArray.count; index++) {
                                                            NSDictionary *dict = dummyCatArray[index];
                                                            imageCatagory *imgModel = [[imageCatagory alloc]init];
                                                            [imgModel setModelWithDict:dict];
                                                            [pageArrayData addObject:imgModel];
                                                            
                                                        }
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            [_pageCollectionView reloadData];
                                                            _pageCollectionView.delegate = self;
                                                            _pageCollectionView.dataSource = self;
                                                            timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(performSlideAnimation:) userInfo:nil repeats:true];
                                                            currentAnimationIndex = 0;
                                                            
                                                        });

                                                        
                                                    }
                                                }];

    [dataTask resume];
}

-(IBAction)performSlideAnimation:(id)sender{
    [self.collectionView layoutIfNeeded];
    if (currentAnimationIndex >= pageArrayData.count) {
        currentAnimationIndex = 0;
    }
    NSIndexPath *nextItem = [NSIndexPath indexPathForItem:currentAnimationIndex inSection:0];
    [_pageCollectionView scrollToItemAtIndexPath:nextItem atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    currentAnimationIndex = currentAnimationIndex + 1;
    
}

-(void)getcatagory{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/newfetchmaa.php"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:20.0];
    [request setHTTPMethod:@"POST"];
    NSURLSession *session1 = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session1 dataTaskWithRequest:request
                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                     if (error) {
                                                         NSLog(@"%@", error);
                                                     } else {
                                                         NSHTTPURLResponse *catagoryResponse = (NSHTTPURLResponse *) response;
                                                         NSLog(@"%@", catagoryResponse);
                                                         
                                                         NSArray *catagoryArr=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                         NSLog(@"%@",catagoryArr);
                                                         
                                                         NSArray *dammycatagoryArray=[catagoryArr valueForKey:@"categories"];
                                                         NSLog(@"%@",dammycatagoryArray);
                                                        
                                                
                                                         int catIndex;
                                                         for (catIndex = 0; catIndex < dammycatagoryArray.count; catIndex++) {
                                                             NSDictionary *dict = dammycatagoryArray[catIndex];
                                                               CategoryModel *catModel = [[CategoryModel alloc]init];
                                                             NSLog(@"%@",dict);
                                                             [catModel setModelWithDict:dict];
                                                             NSLog(@"%@",catModel);
                                                             [_mainArray addObject:catModel];
                                                             NSLog(@"%@",_mainArray);
//                                                            
                                                             
                                                         }
                                                         dispatch_async(dispatch_get_main_queue(), ^(void){
                                                             //Run UI Updates
                                                             
                                                             [_catogorysTableView reloadData];
                                                             _collectionView.dataSource = self;
                                                             _collectionView.delegate = self;
                                                             [_collectionView reloadData];

                                                         });

                                                     
                                                     }
                                                 }];
    [dataTask resume];
 
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (collectionView==_collectionView) {
        return 1;
    }else{
        return 1;
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView==_collectionView) {
        NSLog(@"%@",_mainArray);
         return _mainArray.count;
        
    }else{
        return pageArrayData.count;
    }
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView==_collectionView) {
        
    
        ItemsCollectionViewCell *cell=[_collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        CategoryModel *model1=[_mainArray objectAtIndex:indexPath.item];
        cell.itemLabel.text=model1.category_name;
        
        
        [cell.itemImage setImageWithURL:[NSURL URLWithString:model1.image] placeholderImage:nil];
        
        return cell;
    }else{
        pageSlideCollectionViewCell *pageSlideCell = [_pageCollectionView dequeueReusableCellWithReuseIdentifier:@"pageSlideCollectionViewCell" forIndexPath:indexPath];
        imageCatagory *model = [pageArrayData objectAtIndex:indexPath.row];
        [pageSlideCell.pageSlideImage setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];
        
        return pageSlideCell;
    }


}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView==_collectionView) {
        NSLog(@"%@",indexPath);
        CategoryModel *model = [_mainArray objectAtIndex:indexPath.row];
        NSLog(@"%@",model);
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ItemsDisplayViewController *items = [story instantiateViewControllerWithIdentifier:@"ItemsDisplayViewController"];
//        NSLog(@"%@",model.category_id);
        [items getId:model.category_id];
//        NSLog(@"%@",model.category_name);
        [items getName:model.category_name];
        [self.navigationController pushViewController:items animated:YES];
    }else{
        
    }
   

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
       return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
          return _mainArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
        CatogorysTableViewCell *tableViewCell=[tableView dequeueReusableCellWithIdentifier:@"CatogorysTableViewCell"];
        _catogorysTblHeight.constant =  _catogorysTableView.contentSize.height;
       CategoryModel *catModel = _mainArray[indexPath.row];
    tableViewCell.catModel = catModel;
    tableViewCell.categoryNameLabel.text = catModel.category_name;
  
    [tableViewCell.categoryButton addTarget:self action:@selector(clickOnAdd:) forControlEvents:UIControlEventTouchUpInside];
    tableViewCell.categoryButton.tag = indexPath.row;
    NSLog(@"%ld",(long)tableViewCell.categoryButton.tag);
        return tableViewCell;
    
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//      CatogorysTableViewCell *tableViewCell=[tableView dequeueReusableCellWithIdentifier:@"CatogorysTableViewCell"];
//    tableViewCell.categoryButton.tag = indexPath.row;
//      ItemsDisplayViewController *itemVc = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemsDisplayViewController"];
//    [self.navigationController pushViewController:itemVc animated:YES];
//}

-(void)clickOnAdd:(UIButton *)sender{
    ItemsDisplayViewController *itemVc = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemsDisplayViewController"];
    [self.navigationController pushViewController:itemVc animated:YES];
    CategoryModel *model1 = [_mainArray objectAtIndex:sender.tag];
    NSLog(@"%@",model1);
    NSLog(@"%@",model1.category_id);
    [itemVc getId:model1.category_id];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)createNewImage{
//
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//@"http://samenslifestyle.com/samenslifestyle123.com/admin_dashboard/slider_image"
@end
