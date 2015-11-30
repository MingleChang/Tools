//
//  MCCityChooseViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/29.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCCityChooseViewController.h"
#import "MCWeatherManager.h"
#import "MingleChang.h"
#import "MCWeatherProvince.h"
#import "MCWeatherCity.h"
#import "MCWeatherArea.h"
#import "MCSearchCity.h"

#define CITY_CHOOSE_CELL_ID @"MCCityChooseCell"

@interface MCCityChooseViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property(nonatomic,copy)NSArray *searchCities;

@end

@implementation MCCityChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private Motheds
-(void)searchCitiesWith:(NSString *)key{
    NSMutableArray *lSearchCities=[NSMutableArray array];
    for (MCWeatherProvince *lProvince in [MCWeatherManager manager].cityList) {
        if ([lProvince.name containsString:key]) {
            for (MCWeatherCity *lCity in lProvince.weatherCities) {
                for (MCWeatherArea *lArea in lCity.weatherAreas) {
                    MCSearchCity *lSearchCity=[[MCSearchCity alloc]init];
                    lSearchCity.provinceName=lProvince.name;
                    lSearchCity.cityName=lCity.name;
                    lSearchCity.areaName=lArea.name;
                    lSearchCity.identity=lArea.identity;
                    [lSearchCities addObject:lSearchCity];
                }
            }
        }else{
            for (MCWeatherCity *lCity in lProvince.weatherCities) {
                if ([lCity.name containsString:key]) {
                    for (MCWeatherArea *lArea in lCity.weatherAreas) {
                        MCSearchCity *lSearchCity=[[MCSearchCity alloc]init];
                        lSearchCity.provinceName=lProvince.name;
                        lSearchCity.cityName=lCity.name;
                        lSearchCity.areaName=lArea.name;
                        lSearchCity.identity=lArea.identity;
                        [lSearchCities addObject:lSearchCity];
                    }
                }else{
                    for (MCWeatherArea *lArea in lCity.weatherAreas) {
                        if ([lArea.name containsString:key]) {
                            MCSearchCity *lSearchCity=[[MCSearchCity alloc]init];
                            lSearchCity.provinceName=lProvince.name;
                            lSearchCity.cityName=lCity.name;
                            lSearchCity.areaName=lArea.name;
                            lSearchCity.identity=lArea.identity;
                            [lSearchCities addObject:lSearchCity];
                        }
                    }
                }
            }
        }
    }
    self.searchCities=lSearchCities;
}
#pragma mark - Delegate
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.searchCities.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    MCSearchCity *lSearchCity=[self.searchCities objectAtIndex:row];
    UITableViewCell *lCell=[tableView dequeueReusableCellWithIdentifier:CITY_CHOOSE_CELL_ID forIndexPath:indexPath];
    lCell.textLabel.text=[NSString stringWithFormat:@"%@-%@-%@",lSearchCity.provinceName,lSearchCity.cityName,lSearchCity.areaName];
    return lCell;
}
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row=[indexPath row];
    MCSearchCity *lSearchCity=[self.searchCities objectAtIndex:row];
    [MCWeatherManager manager].lastCityId=lSearchCity.identity;
    [MCWeatherManager manager].method=GetWeatherMethodSelected;
    [MCWeatherManager manager].weatherInfo=nil;
    [[MCWeatherManager manager]saveWeatherMethodAndLastCityId];
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - UISearchBar Delegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self searchCitiesWith:searchBar.text];
    [searchBar resignFirstResponder];
    [self.tableView reloadData];
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
    self.navigationItem.title=@"选择城市";
}
@end
