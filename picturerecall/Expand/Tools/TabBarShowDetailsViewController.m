//
//  TabBarShowDetailsViewController.m
//  picturerecall
//
//  Created by YangY on 2018/2/27.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "TabBarShowDetailsViewController.h"
#import "CreateAtlasViewController.h"

@interface TabBarShowDetailsViewController ()

@end

@implementation TabBarShowDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] init];
    [tap addTarget:self action:@selector(dismissView)];
    [self.view addGestureRecognizer:tap];
}

- (void)dismissView{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickCamera:(id)sender {
    CreateAtlasViewController * create = [[CreateAtlasViewController alloc] init];
    UINavigationController * createNav = [[UINavigationController alloc]initWithRootViewController:create];
    [self presentViewController:createNav animated:YES completion:nil];
    
}

- (IBAction)clickLive:(id)sender {
    
}

@end
