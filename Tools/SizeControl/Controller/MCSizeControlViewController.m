//
//  MCSizeControlViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/14.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCSizeControlViewController.h"
#import "MCSizeControlChooseView.h"
#import "MingleChang.h"

#define WOMAN_SHOES @"woman_shoes"//女鞋
#define WOMAN_SHIRT @"woman_shirt"//衬衫
#define WOMAN_DRESS @"woman_dress"//连衣裙
#define WOMAN_PANTS @"woman_pants"//裤子
#define WOMAN_BRIEFS @"woman_briefs"//内裤
#define WOMAN_BRA @"woman_bra"//文胸

#define MAN_SHOES @"man_shoes"//男鞋
#define MAN_JACKET @"man_jacket"//上衣
#define MAN_SHIRT @"man_shirt"//衬衫
#define MAN_SUIT @"man_suit"//西装
#define MAN_PANTS @"woman_pants"//裤子
#define MAN_BRIEFS @"woman_briefs"//内裤

#define KID_SHOES @"kid_shoes"//童鞋
#define KID_CLOTHES @"kid_clothes"//童装

@interface MCSizeControlViewController ()<MCSizeControlChooseViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong,nonatomic)UIButton *selectedButton;
@property (weak, nonatomic) IBOutlet UIButton *womanButton;
@property (weak, nonatomic) IBOutlet UIButton *manButton;
@property (weak, nonatomic) IBOutlet UIButton *kidButton;
@property (weak, nonatomic) IBOutlet MCSizeControlChooseView *womanChooseView;
@property (weak, nonatomic) IBOutlet MCSizeControlChooseView *manChooseView;
@property (weak, nonatomic) IBOutlet MCSizeControlChooseView *kidChooseView;

@property (weak, nonatomic) IBOutlet UIImageView *infoImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoImageViewHeightConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineHeightConstraint;
- (IBAction)womanButtonClick:(UIButton *)sender;
- (IBAction)manButtonClick:(UIButton *)sender;
- (IBAction)kidButtonClick:(UIButton *)sender;

@end

@implementation MCSizeControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private Mothed
-(void)selectedButton:(UIButton *)button{
    self.selectedButton.backgroundColor=[UIColor clearColor];
    self.selectedButton.enabled=YES;
    self.selectedButton=button;
    self.selectedButton.backgroundColor=[UIColor colorWithWhite:0 alpha:0.35];
    self.selectedButton.enabled=NO;
}
-(void)selectedWomanButton{
    [self selectedButton:self.womanButton];
    self.womanChooseView.hidden=NO;
    self.manChooseView.hidden=YES;
    self.kidChooseView.hidden=YES;
    [self resetInfoImageView];
}
-(void)selectedManButton{
    [self selectedButton:self.manButton];
    self.womanChooseView.hidden=YES;
    self.manChooseView.hidden=NO;
    self.kidChooseView.hidden=YES;
    [self resetInfoImageView];
}
-(void)selectedKidButton{
    [self selectedButton:self.kidButton];
    self.womanChooseView.hidden=YES;
    self.manChooseView.hidden=YES;
    self.kidChooseView.hidden=NO;
    [self resetInfoImageView];
}
-(void)resetInfoImageView{
    if ([self.selectedButton isEqual:self.womanButton]) {
        NSString *imageName=@"";
        switch (self.womanChooseView.selectedIndex) {
            case 0:
                imageName=WOMAN_SHOES;
                break;
            case 1:
                imageName=WOMAN_SHIRT;
                break;
            case 2:
                imageName=WOMAN_DRESS;
                break;
            case 3:
                imageName=WOMAN_PANTS;
                break;
            case 4:
                imageName=WOMAN_BRIEFS;
                break;
            case 5:
                imageName=WOMAN_BRA;
                break;
            default:
                imageName=WOMAN_SHOES;
                break;
        }
        [self resetInfoImageViewWith:imageName];
        return;
    }
    if ([self.selectedButton isEqual:self.manButton]) {
        NSString *imageName=@"";
        switch (self.manChooseView.selectedIndex) {
            case 0:
                imageName=MAN_SHOES;
                break;
            case 1:
                imageName=MAN_JACKET;
                break;
            case 2:
                imageName=MAN_SHIRT;
                break;
            case 3:
                imageName=MAN_SUIT;
                break;
            case 4:
                imageName=MAN_PANTS;
                break;
            case 5:
                imageName=MAN_BRIEFS;
                break;
            default:
                imageName=MAN_SHOES;
                break;
        }
        [self resetInfoImageViewWith:imageName];
        return;
    }
    if ([self.selectedButton isEqual:self.kidButton]) {
        NSString *imageName=@"";
        switch (self.kidChooseView.selectedIndex) {
            case 0:
                imageName=KID_SHOES;
                break;
            case 1:
                imageName=KID_CLOTHES;
                break;
            default:
                imageName=KID_SHOES;
                break;
        }
        [self resetInfoImageViewWith:imageName];
        return;
    }
}
-(void)resetInfoImageViewWith:(NSString *)imageName{
    UIImage *lImage=[UIImage imageNamed:imageName];
    self.infoImageView.image=lImage;
    self.infoImageViewHeightConstraint.constant=lImage.size.height/lImage.size.width*SCREEN_WIDTH;
    [self.scrollView setContentOffset:CGPointZero];
}
#pragma mark - Event Response
- (IBAction)womanButtonClick:(UIButton *)sender {
    [self selectedWomanButton];
}

- (IBAction)manButtonClick:(UIButton *)sender {
    [self selectedManButton];
}

- (IBAction)kidButtonClick:(UIButton *)sender {
    [self selectedKidButton];
}
#pragma mark - MCSizeControlChooseView Delegate
-(void)sizeControlChooseView:(MCSizeControlChooseView *)view selectedIndex:(NSInteger)index{
    [self resetInfoImageView];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    self.lineHeightConstraint.constant=ONE_PIXEL;
    [self selectedWomanButton];
}
-(void)configureData{
    
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    self.navigationItem.title=@"尺码对照表";
}
@end
