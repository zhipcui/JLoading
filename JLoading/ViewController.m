//
//  ViewController.m
//  JLoading
//
//  Created by zpcui on 15/11/11.
//  Copyright © 2015年 com.czp. All rights reserved.
//

#import "ViewController.h"
#import "JLodingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor purpleColor];
    
    CGRect screen = [UIScreen mainScreen].bounds;
    
    JLodingView *loadingView = [[JLodingView alloc] initWithFrame:CGRectMake(CGRectGetWidth(screen) / 2.0  ,CGRectGetHeight(screen) / 2.0, 100, 100)];
    loadingView.center = CGPointMake(CGRectGetWidth(screen) / 2.0  ,CGRectGetHeight(screen) / 2.0);
    [self.view addSubview:loadingView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
