//
//  EditInfoViewController.m
//  picturerecall
//
//  Created by Bai on 2018/3/16.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "EditInfoViewController.h"

@interface EditInfoViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textView_Height;

@end

@implementation EditInfoViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.textView becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem * right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"round_check"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightBtn)];
    self.navigationItem.rightBarButtonItem = right;
    if (self.editType == Edit_Name) {
        self.textView_Height.constant = 35;
    }
    if (self.text) {
        self.textView.text = self.text;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)clickRightBtn{
    if (self.editInfo) {
        self.editInfo(self.textView.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
