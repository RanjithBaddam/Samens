//
//  signupViewController.m
//  samens
//
//  Created by All time Support on 01/06/17
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "signupViewController.h"
#import <MBProgressHUD.h>
#import "verificationViewController.h"

@interface signupViewController ()
@property(nonatomic,weak)IBOutlet UITextField *nameTF;
@property(nonatomic,weak)IBOutlet UITextField *emailTF;
@property(nonatomic,weak)IBOutlet UITextField *passwordTF;
@property(nonatomic,weak)IBOutlet UITextField *confirmpasswordTF;
@property(nonatomic,weak)IBOutlet UITextField *mobileNumTF;
@property(nonatomic,strong)NSArray *array;
@end

@implementation signupViewController
@synthesize nameTF,emailTF,passwordTF,confirmpasswordTF,mobileNumTF;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}
-(IBAction)clickOnSignUp:(id)sender{
    if ([nameTF.text isEqualToString:@""]||[emailTF.text isEqualToString:@""]||[passwordTF.text isEqualToString:@""]||[confirmpasswordTF.text isEqualToString:@""]||[mobileNumTF.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sigup Failed" message:@"Please fill all the details" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *urlInstring =[NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/request_sms.php"];
    NSURL *url=[NSURL URLWithString:urlInstring];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
        NSString *params = [NSString stringWithFormat:@"name=%@&email=%@&password=%@&mobile=%@",nameTF.text,emailTF.text,passwordTF.text,mobileNumTF.text];
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
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Signup failed" message:@"Please fill correct details" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alertView show];
            }else{
                
                id jsonObj=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
                NSLog(@"%@",jsonObj);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    verificationViewController *verifyVc = [self.storyboard instantiateViewControllerWithIdentifier:@"verificationViewController"];
                    [self.navigationController pushViewController:verifyVc animated:YES];
                });
            }
        } ];
        [task resume];
}
}
- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
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



@end
