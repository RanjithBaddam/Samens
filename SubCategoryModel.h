//
//  SubCategoryModel.h
//  samens
//
//  Created by All time Support on 12/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubCategoryModel : NSObject
@property(nonatomic,strong)NSString *Name;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *pid;
@property(nonatomic,strong)NSString *color_code;
@property(nonatomic,strong)NSString *image2;
@property(nonatomic,strong)NSString *image3;
@property(nonatomic,strong)NSString *image4;

@property(nonatomic,strong)NSMutableArray *subsubArray;



-(void)setModelWithDict:(NSDictionary *)dict;

@end
