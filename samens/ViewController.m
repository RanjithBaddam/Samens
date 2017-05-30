//
//  ViewController.m
//  samens
//
//  Created by All time Support on 30/05/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property(nonatomic,weak)IBOutlet UITextField *emailTextField;
@property(nonatomic,weak)IBOutlet UITextField *passwordTextField;
@property(nonatomic,weak)IBOutlet UIView *pageView;
@property(nonatomic,strong)NSMutableArray *imgArray;
@property(nonatomic,weak)IBOutlet UIView *popUpView;
@end

@implementation ViewController
@synthesize passwordTextField;
@synthesize emailTextField,arrPageImages,PageViewController;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    emailTextField.delegate=self;
    passwordTextField.delegate=self;
    
//    arrPageImages =@[];
//    self.PageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
//    self.PageViewController.dataSource = self;
//    
//    pageContentViewController *startingViewController = [self viewControllerAtIndex:0];
//    NSArray *viewControllers = @[startingViewController];
//    [self.PageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
//    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
//-(void)viewDidAppear:(BOOL)animated{
//    [self.pageView layoutIfNeeded];
//    PageViewController.view.frame=CGRectMake(0, 0, self.pageView.frame.size.width, self.pageView.frame.size.height);
//    [self addChildViewController:PageViewController];
//    [self.pageView addSubview:PageViewController.view];
//    [self.PageViewController didMoveToParentViewController:self];
//    
//    _imgArray=[[NSMutableArray alloc]initWithObjects: nil];
//    
//}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(IBAction)clickOnCreateAccount:(id)sender{
    
    self.popUpView.hidden=NO;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
