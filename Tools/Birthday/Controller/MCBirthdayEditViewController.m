//
//  MCBirthdayEditViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/23.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCBirthdayEditViewController.h"
#import "MingleChang.h"
#import "MCBirthday.h"
#import "MCBirthdayDatePicker.h"

@interface MCBirthdayEditViewController ()<MCBirthdayDatePickerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet MCTextField *dateTextField;

@property(nonatomic,strong)MCBirthdayDatePicker *datePicker;

@end

@implementation MCBirthdayEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)saveBirthday{
    if (self.birthday.isSave) {
        if ([self.birthday isValid]) {
            [self.birthday update];
        }else{
            [self.birthday destroy];
            [self.birthdayArray removeObject:self.birthday];
        }
    }else{
        if ([self.birthday isValid]) {
            [self.birthday save];
            [self.birthdayArray addObject:self.birthday];
        }else{
            
        }
    }
}
#pragma mark - Delegate

#pragma mark - MCBirthdayDatePicker Delegate
-(void)birthdayDatePicker:(MCBirthdayDatePicker *)datePicker changeType:(MCBirthdayDatePickerType)type{
    self.birthday.type=(BirthdayType)type;
    self.dateTextField.text=[self.birthday displayBirthday];
}
-(void)birthdayDatePicker:(MCBirthdayDatePicker *)datePicker changeDate:(NSDate *)date{
    self.birthday.birthday.date=date;
    self.dateTextField.text=[self.birthday displayBirthday];
    
}
-(void)birthdayDatePickerDone:(MCBirthdayDatePicker *)datePicker{
    [self.dateTextField resignFirstResponder];
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
    self.datePicker=[[NSBundle mainBundle]loadNibNamed:@"MCBirthdayDatePicker" owner:nil options:nil][0];
    self.datePicker.delegate=self;
    self.dateTextField.inputView=self.datePicker;
    self.dateTextField.inputAccessoryView=[[UIView alloc]init];
}
-(void)configureData{
    self.nameTextField.text=self.birthday.name;
    self.dateTextField.text=[self.birthday displayBirthday];
    self.datePicker.date=self.birthday.birthday.date;
    self.datePicker.type=(MCBirthdayDatePickerType)self.birthday.type;
}
#pragma mark - Event Response
-(void)backBarButtonItemClick:(UIBarButtonItem *)sender{
    self.birthday.name=[self.nameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [self saveBirthday];
    [super backBarButtonItemClick:sender];
}
-(void)trashBarButtonItemClick:(UIBarButtonItem *)sender{
    [self.nameTextField resignFirstResponder];
    [self.dateTextField resignFirstResponder];
    UIAlertController *lAlertController=[UIAlertController alertControllerWithTitle:@"删除该记录?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *lCancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    [lAlertController addAction:lCancelAction];
    UIAlertAction *lOKAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (self.birthday.isSave) {
            [self.birthday destroy];
            [self.birthdayArray removeObject:self.birthday];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [lAlertController addAction:lOKAction];
    [self presentViewController:lAlertController animated:YES completion:nil];
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    UIBarButtonItem *lTrashBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_trash"] style:UIBarButtonItemStyleDone target:self action:@selector(trashBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem=lTrashBarButtonItem;
}
@end
