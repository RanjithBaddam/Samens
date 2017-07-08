 //
//  AccountViewController.m
//  samens
//
//  Created by All time Support on 16/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "AccountViewController.h"
#import "ViewController.h"

@interface AccountViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *ImgArray,*secImgArray;
    NSMutableArray *firstSectionArray;
    NSMutableArray *detailArray;
    NSMutableArray *secSectionArray;
    NSMutableArray *thirdSectionArray;
    NSMutableArray *fourthSectionArray;
}

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [[NSUserDefaults.standardUserDefaults valueForKey:@"LoggedIn"]isEqualToString:@"yes"];
    NSString *loginCustId = self.loginModel.custid;
    NSString *loginApi = self.loginModel.api;
    NSLog(@"%@%@",loginApi,loginCustId);
    
    self.scrollView.contentSize = CGSizeMake(414, 718);
  
    ImgArray = [[NSMutableArray alloc]initWithObjects:@"cancelBtn", nil];
    secImgArray = [[NSMutableArray alloc]initWithObjects:@"home", nil];
    firstSectionArray = [[NSMutableArray alloc]initWithObjects:@"Sign in", nil];
    detailArray = [[NSMutableArray alloc]initWithObjects:@"View your order,wallet balance,etc", nil];
    
    secSectionArray = [[NSMutableArray alloc]initWithObjects:@"Track Order", nil];
    thirdSectionArray = [[NSMutableArray alloc]initWithObjects:@"Help Center",@"My Rewards",@"Rate the App",@"Send Feedback", nil];
    fourthSectionArray = [[NSMutableArray alloc]initWithObjects:@"Clear History",@"Legal", nil];
    
    self.AccountTableView.delegate = self;
    self.AccountTableView.dataSource = self;
   
}
-(void)viewWillAppear:(BOOL)animated{

    [_AccountTableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickOnSignIn:(id)sender{
    ViewController *loginVc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:loginVc animated:YES];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return firstSectionArray.count;
    }else if (section==1){
        return secSectionArray.count;
    }else if (section==2){
        return thirdSectionArray.count;
    }else{
        return fourthSectionArray.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.section==0) {
        
        cell.imageView.image = [UIImage imageNamed:[ImgArray objectAtIndex:indexPath.row]];
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"LoggedIn"] isEqualToString:@"yes"]){
            cell.textLabel.text = @"Sign Out";
        }else{
            cell.textLabel.text = @"Sign In";
        }
    }else if (indexPath.section==1){
        cell.imageView.image = [UIImage imageNamed:[secImgArray objectAtIndex:indexPath.row]];
        cell.textLabel.text = [secSectionArray objectAtIndex:indexPath.row];
    }else if (indexPath.section==2){
        if (indexPath.row==0) {
            cell.textLabel.text = [thirdSectionArray objectAtIndex:indexPath.row];
        }else if (indexPath.row==1){
            cell.textLabel.text = [thirdSectionArray objectAtIndex:indexPath.row];
        }else if (indexPath.row==2){
            cell.textLabel.text = [thirdSectionArray objectAtIndex:indexPath.row];
        }else if (indexPath.row==3){
            cell.textLabel.text = [thirdSectionArray objectAtIndex:indexPath.row];
        }
    }else if (indexPath.section==3){
        if (indexPath.row==0) {
            cell.textLabel.text = [fourthSectionArray objectAtIndex:indexPath.row];
        }else{
            cell.textLabel.text = [fourthSectionArray objectAtIndex:indexPath.row];
        }
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"LoggedIn"] isEqualToString:@"yes"]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"SignOut" message:@"You want to SignOut" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"SignOut", nil];
            [alert show];
            alert.tag = 100;
        }
        else{
            ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }

    }
}




-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
     if (alertView.tag == 100){
        if (buttonIndex == 1){
            [[NSUserDefaults standardUserDefaults] setValue:@"no" forKey:@"LoggedIn"];
            [_AccountTableView reloadData];
        }
    }
}
@end
