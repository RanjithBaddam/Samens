//
//  AddToCartViewController.m
//  samens
//
//  Created by All time Support on 30/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "AddToCartViewController.h"
#import "AddToCartModel.h"
#import "AddToCartTableViewCell.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import <MBProgressHUD.h>
#import "DetailsTableViewCell.h"
@interface AddToCartViewController ()<UITableViewDelegate,UITableViewDataSource>{
    AddToCartModel *addToCartModel;
    NSMutableArray *AddToCartData;
    NSMutableArray *Remove;
    NSMutableArray *AmountArray;
    NSString *finalSum;
    IBOutlet UIView *quantityView;
}

@end

@implementation AddToCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self FetchAddToCart];
    AmountArray = [[NSMutableArray alloc]initWithObjects:@"price",@"Delivery", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)FetchAddToCart{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *urlInstring =[NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/fetch_basketdata.php"];
    NSURL *url=[NSURL URLWithString:urlInstring];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSString *params = [NSString stringWithFormat:@"cid=%@&api=%@",[NSUserDefaults.standardUserDefaults valueForKey:@"custid"],[NSUserDefaults.standardUserDefaults valueForKey:@"api"]];
    NSLog(@"%@",params);
    
    NSData *requestData = [params dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",requestData);
    [request setHTTPBody:requestData];
    
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    [config setTimeoutIntervalForRequest:30.0];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
        if (error) {
            NSLog(@"%@",err);
            _AddToCartTableView.hidden = YES;
            if ([error.localizedDescription isEqualToString:@"The request timed out."]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"The requste timed out. Please try again" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
                    alertView.tag = 001;
                    [alertView show];
                });
            }else if ([error.localizedDescription isEqualToString:@"The Internet connection appears to be offline."]){
                dispatch_async(dispatch_get_main_queue(),^{
                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"The Internet connection appears to be offline." message:@"" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    alertView.tag = 002;
                    [alertView show];
                });
            }

        }else{
            id jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"%@",response);
            NSLog(@"%@",jsonData);
           
            NSArray *dammyArray = [jsonData valueForKey:@"categories"];
            int index;
            AddToCartData = [[NSMutableArray alloc]init];
            float eachPrice = 0;
            for (index=0; index<dammyArray.count; index++) {
                NSDictionary *dict = dammyArray[index];
                eachPrice += [[dict valueForKey:@"price"] floatValue];
                addToCartModel = [[AddToCartModel alloc]init];
                [addToCartModel AddToCartModelWithDictionary:dict];
                [AddToCartData addObject:addToCartModel];
            }
            finalSum = [NSString stringWithFormat:@"%.0f",eachPrice];
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                _AddToCartTableView.delegate = self;
                _AddToCartTableView.dataSource = self;
                [_AddToCartTableView reloadData];
                
            });
        }
    }];
    [task resume];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        NSLog(@"%lu",(unsigned long)AddToCartData.count);
        return AddToCartData.count;
    }else{
    return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
        AddToCartTableViewCell *cell = [_AddToCartTableView dequeueReusableCellWithIdentifier:@"AddToCartTableViewCell"];
        addToCartModel = [AddToCartData objectAtIndex:indexPath.row];
        NSLog(@"%@",addToCartModel.image);
        [cell.ProductImage setImageWithURL:[NSURL URLWithString:addToCartModel.image] placeholderImage:nil];
        cell.ProductNameLabel.text = addToCartModel.name;
        cell.colorLabel.text = addToCartModel.color;
        cell.SizeLabel.text = addToCartModel.size;
        cell.PriceLabel.text = addToCartModel.price;
        [cell.removeButton addTarget:self action:@selector(clickOnRemoveAddtoCart:) forControlEvents:UIControlEventTouchUpInside];
        cell.removeButton.tag = indexPath.row;
        NSLog(@"%ld",(long)cell.removeButton.tag);
        
        [cell.moveToWishListButton addTarget:self action:@selector(clickOnMoveTowishList:) forControlEvents:UIControlEventTouchUpInside];
        cell.moveToWishListButton.tag = indexPath.row;
        NSLog(@"%ld",(long)cell.moveToWishListButton.tag);
        cell.quantityButton.tag = indexPath.row;
        NSLog(@"%ld",(long)cell.quantityButton.tag);

        [cell.quantityButton addTarget:self action:@selector(ClickOnQuantity:) forControlEvents:UIControlEventTouchUpInside];
        return cell;

    }else{
        DetailsTableViewCell *cell;
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"DetailsTableViewCell" owner:nil options:nil];
        for (id curentObject in topLevelObjects)
        {
            
            if ([curentObject isKindOfClass:[UITableViewCell class]])
            {
          cell = [[DetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DetailsTableViewCell"];
                cell = (DetailsTableViewCell *)curentObject;
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                NSLog(@"%@",addToCartModel.priceArray);
                cell.PriceAmountLabel.text = finalSum;
                cell.DeliveryLabel.text = @"Free";
                cell.AmountPayableLabel.text = finalSum;
                break;
            }
        }
        return cell;
    }

}



-(IBAction)clickOnRemoveAddtoCart:(UIButton *)sender{

    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *urlInstring =[NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/deletefeed.php"];
    NSURL *url=[NSURL URLWithString:urlInstring];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    addToCartModel = [AddToCartData objectAtIndex:sender.tag];
    NSString *params = [NSString stringWithFormat:@"cid=%@&api=%@&pid=%@",[NSUserDefaults.standardUserDefaults valueForKey:@"custid"],[NSUserDefaults.standardUserDefaults valueForKey:@"api"],addToCartModel.pid];
    NSLog(@"%@",params);
    
    NSData *requestData = [params dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",requestData);
    [request setHTTPBody:requestData];
    
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    [config setTimeoutIntervalForRequest:30.0];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
        if (error) {
            NSLog(@"%@",err);
            if ([error.localizedDescription isEqualToString:@"The request timed out."]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"The requste timed out. Please try again" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
                    alertView.tag = 001;
                    [alertView show];
                });
            }else if ([error.localizedDescription isEqualToString:@"The Internet connection appears to be offline."]){
                dispatch_async(dispatch_get_main_queue(),^{
                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"The Internet connection appears to be offline." message:@"" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    alertView.tag = 002;
                    [alertView show];
                });
            }

        }else{
            id jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"%@",response);
            NSLog(@"%@",jsonData);
            if([[NSNumber numberWithBool:[[[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error] objectForKey:@"success"] boolValue]] isEqualToNumber:[NSNumber numberWithInt:1]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                  
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [AddToCartData removeObjectAtIndex:sender.tag];
                    [_AddToCartTableView reloadData];
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"User successfully deleted" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                    [self FetchAddToCart];
                  
                });

        }
        }
    
    }];
    [task resume];
}
-(IBAction)clickOnMoveTowishList:(UIButton *)sender{
   
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *urlInstring =[NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/send_indivi_like.php"];
    NSURL *url=[NSURL URLWithString:urlInstring];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSString *params = [NSString stringWithFormat:@"cid=%@&api=%@&status=%@&pid=%@",[NSUserDefaults.standardUserDefaults valueForKey:@"custid"],[NSUserDefaults.standardUserDefaults valueForKey:@"api"],@"Y",addToCartModel.pid];
    NSLog(@"%@",params);
    
    NSData *requestData = [params dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",requestData);
    [request setHTTPBody:requestData];
    
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    [config setTimeoutIntervalForRequest:30.0];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(),^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
        NSError *err;
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
        if (error) {
            NSLog(@"%@",err);
            if ([error.localizedDescription isEqualToString:@"The request timed out."]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"The requste timed out. Please try again" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
                    alertView.tag = 001;
                    [alertView show];
                });
            }else if ([error.localizedDescription isEqualToString:@"The Internet connection appears to be offline."]){
                dispatch_async(dispatch_get_main_queue(),^{
                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"The Internet connection appears to be offline." message:@"" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    alertView.tag = 002;
                    [alertView show];
                });
            }
            
        }else{
            id jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"%@",response);
            NSLog(@"%@",jsonData);

        }}];
    [task resume];
    
}
-(IBAction)ClickOnQuantity:(UIButton *)sender{
    
   
}

-(IBAction)ClickOnChangePincode:(id)sender{
    
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
