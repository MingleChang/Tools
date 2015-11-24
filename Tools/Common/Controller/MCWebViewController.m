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

@property(nonatomic,strong)UIActivityIndicatorView *activityIndicatorView;

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
    [self.activityIndicatorView startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicatorView stopAnimating];
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
-(void)backBarButtonItemClick:(UIBarButtonItem *)sender{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)closeBarButtonItemClick:(UIBarButtonItem *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    UIBarButtonItem *lBackBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_arrow_left"] style:UIBarButtonItemStyleDone target:self action:@selector(backBarButtonItemClick:)];
    UIBarButtonItem *lCloseBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_close"] style:UIBarButtonItemStyleDone target:self action:@selector(closeBarButtonItemClick:)];
    self.navigationItem.leftBarButtonItems=@[lBackBarButtonItem,lCloseBarButtonItem];
    
    self.activityIndicatorView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    UIBarButtonItem *lLeftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:self.activityIndicatorView];
    self.navigationItem.rightBarButtonItem=lLeftBarButtonItem;
}
@end
