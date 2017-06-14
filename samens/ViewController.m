//
//  ViewController.m
//  samens
//
//  Created by All time Support on 30/05/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD.h>
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import "AdsBannerModel.h"
#import "homeViewController.h"
#import "adsScrollCollectionViewCell.h"
#import "signupViewController.h"


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    NSMutableArray *adsMainData;
    NSTimer *timer;
    NSInteger currentAnimationIndex;
    
}
@property(nonatomic,weak)IBOutlet UITextField *emailTextField;
@property(nonatomic,weak)IBOutlet UITextField *passwordTextField;


@end

@implementation ViewController
@synthesize passwordTextField;
@synthesize emailTextField;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    emailTextField.delegate = self;
    passwordTextField.delegate = self;
//    [self adsScrollViewAnimation];
    [self getAdsImages];
    UIImage *image = [UIImage imageNamed:@"titile"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];


    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


-(IBAction)clickOnLogin:(id)sender{
   
    
    if ([emailTextField.text isEqualToString:@""] || [passwordTextField.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Login Failed" message:@"Please fill all the details" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }else{

        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        NSString *urlInstring =[NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/login_samens.php"];
        
        NSURL *url=[NSURL URLWithString:urlInstring];
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        NSString *params = [NSString stringWithFormat:@"email=%@&password=%@",emailTextField.text,passwordTextField.text];
        NSLog(@"%@",params);
        NSData *requestData = [params dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",requestData);
        [request setHTTPBody:requestData];
        
        NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
        [config setTimeoutIntervalForRequest:30.0];
        NSURLSession *session=[NSURLSession sessionWithConfiguration:config];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data , NSURLResponse *response , NSError *error){
            if (error){
                NSLog(@"%@",error);
            }else{
            id jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                NSLog(@"%@",jsonData);
                if([[NSNumber numberWithBool:[[[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error] objectForKey:@"success"] boolValue]] isEqualToNumber:[NSNumber numberWithInt:0]]){
                   dispatch_async(dispatch_get_main_queue(), ^{
                        NSError *Error;
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"User Login" message:[[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&Error] objectForKey:@"message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert show];
                    });
                
                }else{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                        homeViewController *homeVc = [self.storyboard instantiateViewControllerWithIdentifier:@"homeViewController"];
                        [self.navigationController pushViewController:homeVc animated:YES];
                        
                        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                        [userDefaults setValue:@"api" forKey:@"api"];
                        [userDefaults setObject:@"custid" forKey:@"custid"];
                        [userDefaults setObject:@"dor" forKey:@"dor"];
                        [userDefaults setObject:@"email" forKey:@"email"];
                        [userDefaults setObject:@"name" forKey:@"name"];
                        
                        [userDefaults synchronize];
                    });
                }
                    }
                
            
        }];
        
        [task resume];
    }
}
-(void)getAdsImages{
    NSString *urlInstring =[NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/fetch_page_indicater_image.php"];
    
    NSURL *url=[NSURL URLWithString:urlInstring];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSString *params = [NSString stringWithFormat:@"sames=@&sames=@"];
    NSLog(@"%@",params);
    NSData *requestData = [params dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",requestData);
    [request setHTTPBody:requestData];
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    [config setTimeoutIntervalForRequest:30.0];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data , NSURLResponse *response , NSError *error){
        if (error){
            NSLog(@"%@",error);
        }else{
            id jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"%@",jsonData);
            NSArray *dammyImg = [jsonData valueForKey:@"custmer"];
            NSLog(@"%@",dammyImg);
            int index;
            adsMainData = [[NSMutableArray alloc]init];
            for (index=0; index<dammyImg.count; index++) {
                NSDictionary *dict = dammyImg[index];
                AdsBannerModel *model =[AdsBannerModel new];
                [model setModelWithDict:dict];
                [adsMainData addObject:model];
            }
        }
         dispatch_async(dispatch_get_main_queue(), ^{
             _adsScrollCollectionView.delegate = self;
             _adsScrollCollectionView.dataSource = self;
             [_adsScrollCollectionView reloadData];
             timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(performSlideAnimation:) userInfo:nil repeats:true];
             currentAnimationIndex = 0;
                      });

    }];
    [task resume];
}
-(IBAction)performSlideAnimation:(id)sender{
    [self.adsScrollCollectionView layoutIfNeeded];
    if (currentAnimationIndex >= adsMainData.count) {
        currentAnimationIndex = 0;
    }
    NSIndexPath *nextItem = [NSIndexPath indexPathForItem:currentAnimationIndex inSection:0];
    [_adsScrollCollectionView scrollToItemAtIndexPath:nextItem atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    currentAnimationIndex = currentAnimationIndex + 1;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return adsMainData.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    adsScrollCollectionViewCell *cell = [_adsScrollCollectionView dequeueReusableCellWithReuseIdentifier:@"adsScrollCollectionViewCell" forIndexPath:indexPath];
    AdsBannerModel *model = [adsMainData objectAtIndex:indexPath.item];
    [cell.adsScrollImage setImageWithURL:[NSURL URLWithString:model.mob_image] placeholderImage:nil];
    return cell;
}
-(IBAction)clickOnSignup:(id)sender{
    signupViewController *signUpVc = [self.storyboard instantiateViewControllerWithIdentifier:@"signupViewController"];
    [self.navigationController pushViewController:signUpVc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
