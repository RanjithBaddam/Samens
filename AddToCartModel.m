//
//  AddToCartModel.m
//  samens
//
//  Created by All time Support on 30/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "AddToCartModel.h"

@implementation AddToCartModel
-(void)AddToCartModelWithDictionary:(NSDictionary *)dict{
    self.cid = [dict valueForKey:@"cid"];
    NSLog(@"%@",self.cid);
    self.color = [dict valueForKey:@"color"];
    self.custid = [dict valueForKey:@"custid"];
    NSLog(@"%@",self.custid);
    self.image = [NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/admin_dashboard/image/%@",[dict valueForKey:@"image"]];
    NSLog(@"%@",self.image);
    self.name = [dict valueForKey:@"name"];
    self.pid = [dict valueForKey:@"pid"];
    self.price = [dict valueForKey:@"price"];
    self.quantity = [dict valueForKey:@"quantity"];
    self.size = [dict valueForKey:@"size"];
    _priceArray = [[NSMutableArray alloc]initWithObjects:self.price, nil];
}
@end
