//
//  CreateAtlasViewController.m
//  picturerecall
//
//  Created by YangY on 2018/2/28.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "CreateAtlasViewController.h"
#import "EditInfoViewController.h"



@interface CreateAtlasViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    NSArray * _titleArr;
}
@property (weak, nonatomic) IBOutlet UITableView *tablewView;
@property (nonatomic,strong)UISwitch * publicSwitch;
@property (nonatomic,strong)UIImageView * coverImage;

@end

@implementation CreateAtlasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新增图集";
    _titleArr = @[@"图集名称",@"图集封面",@"添加图片",@"图集简介",@"是否公开"];
    self.tablewView.tableFooterView = [UIView new];
    
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"round_close"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBtn)];
    self.navigationItem.leftBarButtonItem = left;
    
    UIBarButtonItem * right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"round_check"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightBtn)];
    self.navigationItem.rightBarButtonItem = right;
}

- (UISwitch *)publicSwitch{
    if (!_publicSwitch) {
        _publicSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(kScreen_Width-70, 10, 40, 30)];
        _publicSwitch.tintColor = APP_Color_TintColor;
        _publicSwitch.onTintColor = APP_Color_TintColor;
    }
    return _publicSwitch;
}

- (UIImageView *)coverImage{
    if (!_coverImage) {
        _coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width - 70, 2, 46, 46)];
    }
    return _coverImage;
}

- (void)clickLeftBtn{
    if ([self respondsToSelector:@selector(presentingViewController)]){
        [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [self.parentViewController.parentViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)clickRightBtn{
    AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar1" forKey:@"foo"];
    [testObject save];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_titleArr count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 4) {
        [cell.contentView addSubview:self.publicSwitch];
    }else if (indexPath.row == 1){
        [cell.contentView addSubview:self.coverImage];
    }
    if (indexPath.row != 4){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.textColor = APP_Color_TitletColor;
    cell.textLabel.font = APP_FONT_Title;
    cell.textLabel.text = _titleArr[indexPath.row];
    cell.detailTextLabel.textColor = APP_Color_DetailsColor;
    cell.detailTextLabel.font = APP_FONT_Details;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 || indexPath.row == 3) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        EditInfoViewController * edit = [[EditInfoViewController alloc] init];
        edit.editInfo = ^(NSString *info) {
            cell.detailTextLabel.text = info;
        };
        edit.text = cell.detailTextLabel.text;
        edit.title = cell.textLabel.text;
        if (indexPath.row == 0) {
            edit.editType = Edit_Name;
        }else{
            edit.editType = Edit_Des;
        }
        [self.navigationController pushViewController:edit animated:YES];
    }else if (indexPath.row == 1){
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:@"选择图集封面照片" preferredStyle:UIAlertControllerStyleActionSheet];
        [alert addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self showPhotoInLibraryOrCamera:0];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self showPhotoInLibraryOrCamera:1];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}
- (void)showPhotoInLibraryOrCamera:(NSInteger)index{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    pickerController.allowsEditing = YES;
    pickerController.delegate = self;
    if (index == 0) {
        pickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    }else{
        pickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
    }
    [self.navigationController presentViewController:pickerController animated:YES completion:^{
        
    }];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *resultImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    self.coverImage.image = resultImage;
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
    }];
}
@end
