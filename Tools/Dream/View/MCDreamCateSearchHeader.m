//
//  MCDreamCateSearchHeader.m
//  Tools
//
//  Created by 常峻玮 on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCDreamCateSearchHeader.h"
#import "MingleChang.h"

@interface MCDreamCateSearchHeader()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
@implementation MCDreamCateSearchHeader

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configure];
}
#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    UITextField *searchField = [self.searchBar valueForKey:@"_searchField"];
    searchField.textColor=[UIColor whiteColor];
}
-(void)configureData{
    
}
#pragma mark - Delegate
#pragma mark - UISearchBar Delegate
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSString *lSearchKey=searchBar.text;
    if ([self.delegate respondsToSelector:@selector(dreamCateSearchHeader:search:)]) {
        [self.delegate dreamCateSearchHeader:self search:lSearchKey];
    }
}
@end
