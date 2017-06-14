//
//  CatProductModel.m
//  samens
//
//  Created by All time Support on 07/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "CatProductModel.h"

@implementation CatProductModel
-(void)setModelWithDict:(NSDictionary*)dict{
    self.image = [NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/admin_dashboard/mob_image/%@",[dict valueForKey:@"image"]];
    self.name = [dict valueForKey:@"name"];
   
}

@end
