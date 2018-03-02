//
//  CreateAtlasViewController.m
//  picturerecall
//
//  Created by YangY on 2018/2/28.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "CreateAtlasViewController.h"

@interface CreateAtlasViewController ()

@end

@implementation CreateAtlasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * bb = [[UIButton alloc] init];
    bb.frame = CGRectMake(0, 0, 100, 100);
    bb.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bb];
    [bb addTarget:self action:@selector(ccc) forControlEvents:UIControlEventTouchUpInside];
    
    AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar1" forKey:@"foo"];
    [testObject save];
}

- (void)ccc{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
