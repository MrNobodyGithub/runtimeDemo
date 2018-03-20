//
//  Machine.h
//  runtimeDemo
//
//  Created by jason on 2018/3/19.
//  Copyright © 2018年 nemo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MachineOne.h" 
@interface Machine : NSObject

/**
 * name
 */
@property (nonatomic,copy) NSString *name;

/**
 * key
 */
@property (nonatomic,copy) NSString *key;

/**
 * dica
 */
@property (nonatomic,strong) MachineOne *dica;

/**
 * arr
 */
@property (nonatomic,strong) NSArray *arr;
@end
