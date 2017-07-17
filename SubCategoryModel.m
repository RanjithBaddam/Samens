//
//  SubCategoryModel.m
//  samens
//
//  Created by All time Support on 12/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "SubCategoryModel.h"

@implementation SubCategoryModel
-(void)setModelWithDict:(NSDictionary *)dict{
    self.Name = [dict valueForKey:@"Name"];
    NSLog(@"%@",self.Name);
    self.image = [NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/admin_dashboard/image/%@",[dict valueForKey:@"image"]];
    NSLog(@"%@",self.image);
    self.price = [dict valueForKey:@"price"];
    self.pid = [dict valueForKey:@"pid"];
    NSLog(@"%@",self.pid);
    self.color_code = [dict valueForKey:@"color_code"];
    self.image2 = [NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/admin_dashboard/image/%@",[dict valueForKey:@"image2"]];
    NSLog(@"%@",self.image2);

    self.image3 = [NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/admin_dashboard/image/%@",[dict valueForKey:@"image3"]];
    NSLog(@"%@",self.image3);
    self.image4 = [NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/admin_dashboard/image/%@",[dict valueForKey:@"image4"]];
    
    self.color = [dict valueForKey:@"color"];
    self.off_price = [dict valueForKey:@"off_price"];
    self.offer = [dict valueForKey:@"offer"];
    self.rating = [dict valueForKey:@"rating"];
    NSLog(@"%@",self.rating);
    
   
}



@end
