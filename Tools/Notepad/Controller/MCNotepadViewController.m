//
//  MCNotepadViewController.m
//  Tools
//
//  Created by 常峻玮 on 15/11/14.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import "MCNotepadViewController.h"
#import "MCNotepadManager.h"
#import "MCNotepad.h"
#import "MCNotepadEditViewController.h"
#import "MCNotepadCell.h"

#define NOTEPAD_EDIT_VC_SEGUE_ID @"MCNotepadEditViewController"
#define NOTEPAD_CELL_ID @"MCNotepadCell"

@interface MCNotepadViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *notepadArray;

@end

@implementation MCNotepadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event Response
-(void)addBarButtonItemClick:(UIBarButtonItem *)sender{
    MCNotepad *lNotepad=[[MCNotepad alloc]init];
    [self performSegueWithIdentifier:NOTEPAD_EDIT_VC_SEGUE_ID sender:lNotepad];
}
#pragma mark - Delegate
#pragma mark - TableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.notepadArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    MCNotepad *lNotepad=self.notepadArray[row];
    MCNotepadCell *lCell=[tableView dequeueReusableCellWithIdentifier:NOTEPAD_CELL_ID forIndexPath:indexPath];
    lCell.notepad=lNotepad;
    return lCell;
}
#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row=[indexPath row];
    MCNotepad *lNotepad=self.notepadArray[row];
    [self performSegueWithIdentifier:NOTEPAD_EDIT_VC_SEGUE_ID sender:lNotepad];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:NOTEPAD_EDIT_VC_SEGUE_ID]) {
        MCNotepadEditViewController *lViewController=(MCNotepadEditViewController *)segue.destinationViewController;
        lViewController.notepad=sender;
        lViewController.notepadArray=self.notepadArray;
    }
}

#pragma mark - Init Methods
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    
}
-(void)configureData{
    self.notepadArray=[[[MCNotepadManager manager]selectAllNotepad]mutableCopy];
}
#pragma mark - Override
-(void)resetNavigationItem{
    [super resetNavigationItem];
    self.navigationItem.title=@"记事本";
    UIBarButtonItem *lAddBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector(addBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem=lAddBarButtonItem;
}
@end
