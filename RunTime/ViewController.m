//
//  ViewController.m
//  RunTime
//
//  Created by zhang_rongwu on 16/2/16.
//  Copyright © 2016年 zhang_rongwu. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+WRImage.h"
@interface ViewController ()
@property (nonatomic, strong)NSMutableArray *list;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *IMAG = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 150)];
    [self.view addSubview:IMAG];
    // 根据不同的系统加载不同的图片
    IMAG.image = [UIImage imageNamed:@"IMAGENAME"];
    
    // 使用运行时修改系统的add方法，过滤掉一些数据
    [self addName:@"111"];
//    [self addName:nil];
    [self addName:@"222"];
    NSLog(@"+++%@", self.list);
}

- (void)addName:(NSString *)name {
    [self.list addObject:name];
}

- (NSMutableArray *)list {
    if (!_list) {
        self.list = [NSMutableArray array];
    }
    return _list;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
