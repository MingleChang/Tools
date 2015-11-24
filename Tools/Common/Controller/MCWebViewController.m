//
//  MCWebViewController.m
//  Tools
//
//  Created by cjw on 15/11/24.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCWebViewController.h"
#import "MingleChang.h"

@interface MCWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MCWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Public Mothed

#pragma mark - Private Mothed

#pragma mark - Delegate
#pragma mark - UIWebView Delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.navigationItem.title=[self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    self.navigationItem.title=@"加载失败";
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
    NSURL *lURL=[NSURL URLWithString:self.rootURLStr];
    NSURLRequest *lRequest=[NSURLRequest requestWithURL:lURL];
    [self.webView loadRequest:lRequest];
}
#pragma mark - Event Response
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
}
@end
