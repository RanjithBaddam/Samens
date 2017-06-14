//
//  CatProductModel.h
//  samens
//
//  Created by All time Support on 07/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatProductModel : NSObject
@property(nonatomic,strong) NSString * name;
@property(nonatomic,strong) NSString * image;
-(void)setModelWithDict:(NSDictionary*)dict;



@end
