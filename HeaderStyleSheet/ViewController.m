//
//  ViewController.m
//  HeaderStyleSheet
//
//  Created by zouyou on 2017/9/7.
//  Copyright © 2017年 zouyou. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "StyleSheetHeader.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>
@property (nonatomic , strong) UITableView * table;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initializeUserinterface];
    [self updateViewConstraints];
    [self updateFocusIfNeeded];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- private methods
- (void)initializeUserinterface{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.table];
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    
    __weak typeof(self) ws = self;
    
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_left) ;
        make.top.equalTo(ws.view.mas_top);
        make.right.equalTo(ws.view.mas_right);
        make.bottom.equalTo(ws.view.mas_bottom);
    }];
}

#pragma mark -- delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"1"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    
    return cell ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60 ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100 ;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    StyleSheetHeader * he = (StyleSheetHeader *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"12"];
    
    return he ; 
}

#pragma mark -- lazy loading
- (UITableView *)table{
    if(!_table){
        _table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _table.delegate = self ;
        _table.dataSource = self ;
        
        [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"1"];
        
        _table.separatorStyle = UITableViewCellSeparatorStyleNone ;
        
        [_table registerClass:[StyleSheetHeader class] forHeaderFooterViewReuseIdentifier:@"12"];
    }
    return _table;
}

@end
