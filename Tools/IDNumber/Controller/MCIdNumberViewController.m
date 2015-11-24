//
//  MCIdNumberViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCIdNumberViewController.h"
#import "APIStoreRequest.h"
#import "MingleChang.h"
#import "MCIdNumberRoot.h"
#import "MCIdNumber.h"

@interface MCIdNumberViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property(nonatomic,strong)NSURLSessionDataTask *sessionDataTask;

@end

@implementation MCIdNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.textField becomeFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private Motheds
-(BOOL)checkIdNumber:(NSString *)idNumber{
    if (idNumber.length==15||idNumber.length==18) {
        return YES;
    }else{
        return NO;
    }
}
-(void)displayIdNumber:(MCIdNumber *)idNumber{
    self.infoLabel.text=[idNumber displayInfo];
}
#pragma mark - Request
-(void)requestIdNumberInfo{
    [self.sessionDataTask cancel];
    [self.activityIndicatorView startAnimating];
    NSURLRequest *lRequest=[APIStoreRequest getIDNumberRequestWithIDNumber:self.textField.text];
    self.sessionDataTask=[[NSURLSession sharedSession]dataTaskWithRequest:lRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicatorView stopAnimating];
            if (error) {
                return;
            }
            NSDictionary *lDictionary=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            MCIdNumberRoot *lIdNumberRoot=[[MCIdNumberRoot alloc]initWithDictionary:lDictionary];
            [self displayIdNumber:lIdNumberRoot.idNumber];
        });
    }];
    [self.sessionDataTask resume];
}

#pragma mark - Delegate
#pragma mark - UITextField Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    self.infoLabel.text=@"";
    if ([string isEqualToString:@" "]) {
        return NO;
    }
    if (textField.text.length+string.length-range.length<=18) {
        return YES;
    }else{
        return NO;
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([self checkIdNumber:textField.text]) {
        [self requestIdNumberInfo];
    }
    return YES;
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
    
}
-(void)configureData{
    
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    self.navigationItem.title=@"身份证查询";
}
@end
