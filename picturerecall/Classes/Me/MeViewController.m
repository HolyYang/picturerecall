//
//  MeViewController.m
//  picturerecall
//
//  Created by YangY on 2018/2/27.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)loginout:(id)sender {
    [Account loginout];
}

@end
