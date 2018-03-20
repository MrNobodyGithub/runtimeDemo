//
//  ViewController.m
//  runtimeDemo
//
//  Created by jason on 2018/3/19.
//  Copyright © 2018年 nemo. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "UIImage+Z.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "Machine.h"
#import "MachineOne.h"
#import "NSObject+Model.h"
#import <objc/runtime.h>
#import "Coding.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self k_obje_msgSend];
    [self k_class_exchage];
    // 字典转 模型
    [self k_dic_to_model];
    // 归档解档
    [self k_archive_unArchive];
}
- (void)k_archive_unArchive{
    Coding * code = [[Coding alloc] init];
    code.userId = @"10";
    code.userName = @"nemo";
    code.userAge = 18;
    
    [ZCommonTool archiveUserDataWith:code];
    
    Coding * unar = [ZCommonTool unArchiveUserData];
}

- (void)k_dic_to_model{
    NSDictionary * dicA = @{@"onek":@"oneV"};
    NSDictionary * dicB = @{@"onek":@""};
    NSDictionary * dicC = @{@"one":@"kka"};
    NSArray * arr = @[dicC,dicC,dicA,dicB];//@[@"a",@"b",@"c"];
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:@"name_nemo",@"name",@"key_one",@"key",dicA,@"dica",arr,@"arr", nil];
    
    Machine * m  = [Machine modelWithDict:dic];
}
- (void)k_obje_msgSend{ 
    Person *p = [[Person alloc] init];
    // 默认person，没有实现eat方法，可以通过performSelector调用，但是会报错。
    // 动态添加方法就不会报错
    [p performSelector:@selector(eat)];
     
}
- (void)k_class_exchage{ 
    UIImage * image = [UIImage imageNamed:@"back"];
    _imageV.image = image;
    self.imageV.backgroundColor = [UIColor cyanColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
