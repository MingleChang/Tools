//
//  MCReciprocalDayEditViewController.m
//  Tools
//
//  Created by cjw on 15/11/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCReciprocalDayEditViewController.h"
#import "MCReciprocalDay.h"
#import <objc/runtime.h>
#import "MingleChang.h"

@interface MCReciprocalDayEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)datePickerValueChange:(UIDatePicker *)sender;

@end

@implementation MCReciprocalDayEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)saveReciprocalDay{
    if (self.reciprocalDay.isSave) {
        if ([self.reciprocalDay isValid]) {
            [self.reciprocalDay update];
        }else{
            [self.reciprocalDay destroy];
            [self.reciprocalDayArray removeObject:self.reciprocalDay];
        }
    }else{
        if ([self.reciprocalDay isValid]) {
            [self.reciprocalDay save];
            [self.reciprocalDayArray addObject:self.reciprocalDay];
        }else{
            
        }
    }
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
    [self changeDatePickerColor];
}
-(void)configureData{
    self.nameTextField.text=self.reciprocalDay.name;
    self.datePicker.date=self.reciprocalDay.date.date;
}
#pragma mark - Event Response
- (IBAction)datePickerValueChange:(UIDatePicker *)sender{
    self.reciprocalDay.date.date=sender.date;
}
-(void)backBarButtonItemClick:(UIBarButtonItem *)sender{
    self.reciprocalDay.name=[self.nameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [self saveReciprocalDay];
    [super backBarButtonItemClick:sender];
}
-(void)trashBarButtonItemClick:(UIBarButtonItem *)sender{
    [self.nameTextField resignFirstResponder];
    UIAlertController *lAlertController=[UIAlertController alertControllerWithTitle:@"删除该记录?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *lCancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    [lAlertController addAction:lCancelAction];
    UIAlertAction *lOKAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (self.reciprocalDay.isSave) {
            [self.reciprocalDay destroy];
            [self.reciprocalDayArray removeObject:self.reciprocalDay];
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

#pragma mark - Change DatePicker Mode
-(void)changeDatePickerColor{//修改UIDatePicker的字体颜色
    unsigned int outCount;
    int i;
    objc_property_t *pProperty = class_copyPropertyList([UIDatePicker class], &outCount);
    for (i = outCount -1; i >= 0; i--)
    {
        // 循环获取属性的名字   property_getName函数返回一个属性的名称
        NSString *getPropertyName = [NSString stringWithCString:property_getName(pProperty[i]) encoding:NSUTF8StringEncoding];
//        NSString *getPropertyNameString = [NSString stringWithCString:property_getAttributes(pProperty[i]) encoding:NSUTF8StringEncoding];
        if([getPropertyName isEqualToString:@"textColor"])
        {
            [self.datePicker setValue:[UIColor whiteColor] forKey:@"textColor"];
        }
    }
    
    //这里修改当前天的颜色
    SEL selector = NSSelectorFromString(@"setHighlightsToday:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDatePicker instanceMethodSignatureForSelector:selector]];
    BOOL no = NO;
    [invocation setSelector:selector];
    [invocation setArgument:&no atIndex:2];
    [invocation invokeWithTarget:self.datePicker];
}
@end
