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
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickCamera:(id)sender {
    [self dismissView];
    CreateAtlasViewController * create = [[CreateAtlasViewController alloc] init];
    [self presentViewController:create animated:YES completion:^{
        
    }];
    
}

- (IBAction)clickLive:(id)sender {
    
}

@end
