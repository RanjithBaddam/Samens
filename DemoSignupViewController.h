//
//  DemoSignupViewController.h
//  samens
//
//  Created by All time Support on 13/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoSignupViewController : UIViewController
@property(nonatomic,weak)IBOutlet UITextField *nameT;
@property(nonatomic,weak)IBOutlet UITextField *emailT;
@property(nonatomic,weak)IBOutlet UITextField *passwordT;
@property(nonatomic,weak)IBOutlet UITextField *CpasswordT;
@property(nonatomic,weak)IBOutlet UITextField *numberT;
-(IBAction)ClickOnSignUp:(id)sender;

@end
