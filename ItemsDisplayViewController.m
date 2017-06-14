//
//  ItemsDisplayViewController.m
//  samens
//
//  Created by All time Support on 10/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "ItemsDisplayViewController.h"
#import "SubCategoryModel.h"
#import "DisplayItemsCollectionViewCell.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import "SortModel.h"
#import "FilterViewController.h"
#import "SubSubViewController.h"


@interface ItemsDisplayViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
{
    NSString *categoryMainId;
    NSMutableArray *sortMainData;
    UILabel *headerLabel;
    NSString *categoryMainName;
}

@end

@implementation ItemsDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    self.sortTableView.hidden = YES;
    [self getName:categoryMainName];
    [self getId:categoryMainId];
    
    
    NSDictionary *headers = @{ @"content-type": @"multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
                               @"cache-control": @"no-cache",
                               @"postman-token": @"91659f4f-c7ec-9732-1217-24a35239d5b1" };
    NSArray *parameters = @[ @{ @"name": @"subCatId", @"value": categoryMainId } ];
    NSString *boundary = @"----WebKitFormBoundary7MA4YWxkTrZu0gW";
    
    NSError *error;
    NSMutableString *body = [NSMutableString string];
    for (NSDictionary *param in parameters) {
        [body appendFormat:@"--%@\r\n", boundary];
        if (param[@"fileName"]) {
            [body appendFormat:@"Content-Disposition:form-data; name=\"%@\"; filename=\"%@\"\r\n", param[@"name"], param[@"fileName"]];
            [body appendFormat:@"Content-Type: %@\r\n\r\n", param[@"contentType"]];
            [body appendFormat:@"%@", [NSString stringWithContentsOfFile:param[@"fileName"] encoding:NSUTF8StringEncoding error:&error]];
            if (error) {
                NSLog(@"%@", error);
            }
        } else {
            [body appendFormat:@"Content-Disposition:form-data; name=\"%@\"\r\n\r\n", param[@"name"]];
            [body appendFormat:@"%@", param[@"value"]];
        }
    }
    [body appendFormat:@"\r\n--%@--\r\n", boundary];
    NSData *postData = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/fetch_sub_category_item.php"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                        id subCatagoryArr=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                        NSLog(@"%@",subCatagoryArr);
                                                        
                                                        NSArray *dammySubCatArray = [subCatagoryArr valueForKey:@"categories"];
                                                        NSLog(@"%@",dammySubCatArray);
                                                        
                                                        _subCatMainData = [[NSMutableArray alloc]init];
                                                        int index;
                                                        
                                                        for (index=0; index<dammySubCatArray.count; index++) {
                                                            NSDictionary *dict = dammySubCatArray[index];
                                                            SubCategoryModel *subModel = [[SubCategoryModel alloc]init];
                                                            [subModel setModelWithDict:dict];
                                                            [_subCatMainData addObject:subModel];
                                                        }
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            self.DisplayItemsCollectionView.delegate = self;
                                                            self.DisplayItemsCollectionView.dataSource = self;
                                                            [self.DisplayItemsCollectionView reloadData];
                                                        });
                                                    }
                                                    
                                                }];
    [dataTask resume];

    
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _subCatMainData.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DisplayItemsCollectionViewCell *cell = [_DisplayItemsCollectionView dequeueReusableCellWithReuseIdentifier:@"DisplayItemsCollectionViewCell" forIndexPath:indexPath];
    SubCategoryModel *model = [_subCatMainData objectAtIndex:indexPath.item];
    [cell.displayItemImage setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];
    cell.displayItemTextLabel.text = model.Name;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
    SubSubViewController *subsubVc = [self.storyboard instantiateViewControllerWithIdentifier:@"SubSubViewController"];
    SubCategoryModel *subModel = [_subCatMainData objectAtIndex:indexPath.item];
    NSLog(@"%@",subModel.pid);
    [subsubVc getId:subModel.pid];
    [self.navigationController pushViewController:subsubVc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getId:(NSString *)CategoryId;
{
    NSLog(@"%@",CategoryId);
    categoryMainId = CategoryId;
}

-(IBAction)ClickOnSort:(id)sender{
    self.sortTableView.hidden = NO;
    
    NSDictionary *headers = @{ @"content-type": @"multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
                               @"cache-control": @"no-cache",
                               @"postman-token": @"554194aa-7dc1-9888-889c-d059e4257252" };
    NSArray *parameters = @[ @{ @"name": @"cid", @"value": @"1178" } ];
    NSString *boundary = @"----WebKitFormBoundary7MA4YWxkTrZu0gW";
    
    NSError *error;
    NSMutableString *body = [NSMutableString string];
    for (NSDictionary *param in parameters) {
        [body appendFormat:@"--%@\r\n", boundary];
        if (param[@"fileName"]) {
            [body appendFormat:@"Content-Disposition:form-data; name=\"%@\"; filename=\"%@\"\r\n", param[@"name"], param[@"fileName"]];
            [body appendFormat:@"Content-Type: %@\r\n\r\n", param[@"contentType"]];
            [body appendFormat:@"%@", [NSString stringWithContentsOfFile:param[@"fileName"] encoding:NSUTF8StringEncoding error:&error]];
            if (error) {
                NSLog(@"%@", error);
            }
        } else {
            [body appendFormat:@"Content-Disposition:form-data; name=\"%@\"\r\n\r\n", param[@"name"]];
            [body appendFormat:@"%@", param[@"value"]];
        }
    }
    [body appendFormat:@"\r\n--%@--\r\n", boundary];
    NSData *postData = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/search_sub_category.php"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                    }
                                                    id sortData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                    NSLog(@"%@",sortData);
                                                    NSArray *sortDammyArr = [sortData valueForKey:@"category"];
                                                    sortMainData = [[NSMutableArray alloc]init];
                                                    int index;
                                                    for (index=0; index<sortDammyArr.count; index++) {
                                                        NSDictionary *dict = sortDammyArr[index];
                                                        SortModel *model = [[SortModel alloc]init];
                                                        [model setModelWithDict:dict];
                                                        [sortMainData addObject:model];
                                                        NSLog(@"%@",sortMainData);
                                                    }
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        self.sortTableView.delegate = self;
                                                        self.sortTableView.dataSource = self;
                                                        [self.sortTableView reloadData];
                                                    });
                                                    
                                                }];
    [dataTask resume];
    
    
}
-(IBAction)ClickOnFilter:(id)sender{
    FilterViewController *filterVc = [self.storyboard instantiateViewControllerWithIdentifier:@"FilterViewController"];
    [self.navigationController pushViewController:filterVc animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return sortMainData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    SortModel *displayModel = [sortMainData objectAtIndex:indexPath.row];
    cell.textLabel.text = displayModel.name;
    return cell;
}

-(void)getName:(NSString *)CategoryName{
    NSLog(@"%@",CategoryName);
    categoryMainName = CategoryName;
    self.titleLabel.text = categoryMainName;
}








@end
