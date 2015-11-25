//
//  MCMobileViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCMobileViewController.h"
#import "APIStoreRequest.h"
#import "MingleChang.h"
#import "MCMobileRoot.h"
#import "MCMobile.h"

@interface MCMobileViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@property(nonatomic,strong)NSURLSessionDataTask *sessionDataTask;
- (IBAction)buttonClick:(UIButton *)sender;

@end

@implementation MCMobileViewController

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
-(BOOL)checkMobileFormat:(NSString *)mobile{
    return YES;
}
-(void)displayMobile:(MCMobile *)mobile{
    if (mobile) {
        self.infoLabel.text=[mobile displayInfo];
    }else{
        self.infoLabel.text=@"查询失败";
    }
}
#pragma mark - Request
-(void)requestMobileInfo{
    [self.sessionDataTask cancel];
    [self.activityIndicatorView startAnimating];
    NSURLRequest *lRequest=[APIStoreRequest getMobileRequestWithMobile:self.textField.text];
    self.sessionDataTask=[[NSURLSession sharedSession]dataTaskWithRequest:lRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicatorView stopAnimating];
            if (error) {
                return;
            }
            NSDictionary *lDictionary=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            MCMobileRoot *lMobileRoot=[[MCMobileRoot alloc]initWithDictionary:lDictionary];
            [self displayMobile:lMobileRoot.mobile];
        });
    }];
    [self.sessionDataTask resume];
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
#pragma mark - Event Response
- (IBAction)buttonClick:(UIButton *)sender {
    self.infoLabel.text=@"";
    if (![self checkMobileFormat:self.textField.text]) {
        self.infoLabel.text=@"号码格式错误";
        return;
    }
    [self.textField resignFirstResponder];
    [self requestMobileInfo];
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    self.navigationItem.title=@"手机归属地";
}
@end
