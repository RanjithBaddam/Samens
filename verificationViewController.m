//
//  verificationViewController.m
//  samens
//
//  Created by All time Support on 01/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "verificationViewController.h"
#import <MBProgressHUD.h>
#import "homeViewController.h"

@interface verificationViewController ()

@end

@implementation verificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)clickOnOtpDone:(id)sender{
 
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *urlInstring =[NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/verify_otp.php"];
    NSURL *url=[NSURL URLWithString:urlInstring];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSString *params = [NSString stringWithFormat:@"otp=%@",self.otpTextField.text];
    NSLog(@"%@",params);
    
    NSData *requestData = [params dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",requestData);
    [request setHTTPBody:requestData];
    
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    [config setTimeoutIntervalForRequest:30.0];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        if (error) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Otp failed" message:@"Please fill correct details" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }else{
            
            id jsonObj=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
            NSLog(@"%@",jsonObj);
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                homeViewController *homeVc = [self.storyboard instantiateViewControllerWithIdentifier:@"homeViewController"];
                [self.navigationController pushViewController:homeVc animated:YES];
            });
        }
    } ];

    [task resume];
    
}


@end
