//
//  BaseDicToModel.m
//  runtimeDemo
//
//  Created by jason on 2018/3/19.
//  Copyright © 2018年 nemo. All rights reserved.
//

#import "BaseDicToModel.h"

@implementation BaseDicToModel

+(instancetype)DicToModel:(NSDictionary *)dict {
    
     BaseDicToModel *status = [[self alloc] init];
    
    [status setValuesForKeysWithDictionary:dict];
    
    return status;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
