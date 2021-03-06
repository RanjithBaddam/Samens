//
//  FilterViewController.m
//  samens
//
//  Created by All time Support on 12/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.FilterListTableView.delegate = self;
    self.FilterListTableView.dataSource = self;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)SliderChange:(id)sender{
    UISlider *slider = (UISlider *)sender;
    NSString *newValue ;
    newValue = [NSString stringWithFormat:@"%f",slider.value];
    self.sliderLabel.text = newValue;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.section==0) {
        cell.imageView.image = nil;
        cell.textLabel.text = @"Category";
        UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 18.0 ];
        cell.textLabel.font  = myFont;
        cell.detailTextLabel.text = @"Clothing";
        UIFont *myFont1 = [ UIFont fontWithName: @"Arial" size: 13.0 ];
        cell.detailTextLabel.font  = myFont1;
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }else if (indexPath.section==1){
        cell.imageView.image = nil;
        cell.textLabel.text = @"Brand";
        UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 18.0 ];
        cell.textLabel.font  = myFont;
        cell.detailTextLabel.text = @"Select your fevourite brand";
        UIFont *myFont1 = [ UIFont fontWithName: @"Arial" size: 13.0 ];
        cell.detailTextLabel.font  = myFont1;
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }else if (indexPath.section==2){
        cell.imageView.image = nil;
        cell.textLabel.text = @"Offers";
        UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 18.0 ];
        cell.textLabel.font  = myFont;
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }else if (indexPath.section==3){
        cell.imageView.image = nil;
        cell.textLabel.text = @"Discount";
        UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 18.0 ];
        cell.textLabel.font  = myFont;
        cell.detailTextLabel.text = @"Upto 10%,Above 10%,Above 20% and more";
        UIFont *myFont1 = [ UIFont fontWithName: @"Arial" size: 13.0 ];
        cell.detailTextLabel.font  = myFont1;
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }else if (indexPath.section==4){
        cell.imageView.image = nil;
        cell.textLabel.text = @"Color";
        UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 18.0 ];
        cell.textLabel.font  = myFont;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
 
    return cell;
}


@end
