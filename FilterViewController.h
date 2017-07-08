//
//  FilterViewController.h
//  samens
//
//  Created by All time Support on 12/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterViewController : UIViewController
@property(nonatomic,strong)IBOutlet UISlider *slider;
@property(nonatomic,strong)IBOutlet UILabel *sliderLabel;
-(IBAction)SliderChange:(id)sender;
@property(nonatomic,weak)IBOutlet UITableView *FilterListTableView;



@end
