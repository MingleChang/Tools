//
//  MCExpressViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/25.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCExpressViewController.h"
#import "MCExpress.h"
#import "MingleChang.h"
#import "MCWebViewController.h"

@interface MCExpressViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet MCTextField *expressTextField;
@property (weak, nonatomic) IBOutlet UITextField *numTextField;

@property(nonatomic,strong)UIPickerView *pickerView;

@property(nonatomic,copy)NSArray *expressArray;
@property(nonatomic,strong)MCExpress *selectedExpress;

@end

@implementation MCExpressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private Mothed
-(void)readAllExpress{
    NSData *lData=[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"express" ofType:@"json"]];
    NSArray *lArray=[NSJSONSerialization JSONObjectWithData:lData options:NSJSONReadingAllowFragments error:nil];
    self.expressArray=[MCExpress arrayModelByArrayOfDictionary:lArray];
}
-(void)resetExpressTextField{
    self.expressTextField.text=self.selectedExpress.name;
}
#pragma mark - Delegate
#pragma mark - UIPickerView DataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.expressArray.count;
}
#pragma mark - UIPickerView Delegate
-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    MCExpress *lExpress=[self.expressArray objectAtIndex:row];
    NSAttributedString *lAttributedString=[[NSAttributedString alloc]initWithString:lExpress.name attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    return lAttributedString;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    MCExpress *lExpress=[self.expressArray objectAtIndex:row];
    self.selectedExpress=lExpress;
    [self resetExpressTextField];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}
#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    self.pickerView=[[UIPickerView alloc]init];
    self.pickerView.dataSource=self;
    self.pickerView.delegate=self;
    self.expressTextField.inputView=self.pickerView;
}
-(void)configureData{
    [self readAllExpress];
    [self resetExpressTextField];
}
#pragma mark - Event Response
-(void)queryBarButtonItemClick:(UIBarButtonItem *)sender{
    if (self.selectedExpress==nil) {
        return;
    }
    NSString *lExpressNum=[self.numTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (lExpressNum.length==0) {
        return;
    }
    NSString *lURLStr=[NSString stringWithFormat:@"http://m.kuaidi100.com/index_all.html?type=%@&postid=%@&callbackurl=protocol://exit",self.selectedExpress.code,[lExpressNum URLEncode]];
    MCWebViewController *lWebViewController=[[MCWebViewController alloc]init];
    lWebViewController.rootURLStr=lURLStr;
    [self.navigationController pushViewController:lWebViewController animated:YES];
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    self.navigationItem.title=@"快递查询";
    UIBarButtonItem *lQueryBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"查询" style:UIBarButtonItemStyleDone target:self action:@selector(queryBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem=lQueryBarButtonItem;
}

#pragma mark - Setter And Getter
-(MCExpress *)selectedExpress{
    if (_selectedExpress) {
        return _selectedExpress;
    }
    _selectedExpress=self.expressArray.firstObject;
    return _selectedExpress;
}
@end
