//
//  MoreController.m
//  xiaoquchaoshi
//
//  Created by caohaifeng on 8/26/16.
//  Copyright © 2016 大连友商科技有限公司. All rights reserved.
//

#import "MoreController.h"

#import "moreControllerHeaderView.h"
#import "LoginViewController.h"
#import "ChangePasswordController.h"
#import "CommodityManagementController.h"
#import "StatisticsController.h"
#import "MoreControllerCell.h"

@interface MoreController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView              *tableView;
@property(nonatomic,strong) moreControllerHeaderView *headerView;
@property(nonatomic,strong) UIView                   *footerView;
@property(nonatomic,strong) NSArray                  *groups;

@end

@implementation MoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

//懒加载
#pragma mark -- 数组
- (NSArray *)groups {
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"MoreController" ofType:@"plist"];
        _groups = [NSArray arrayWithContentsOfFile:path];
    }
    return _groups;
}

#pragma mark -- tableView
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:kScreenSize style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableHeaderView = self.headerView;
    }
    return _tableView;
}

#pragma mark - Table view data source
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSDictionary *dictionary = self.groups[section];
    NSArray *items = dictionary[@"items"];
    return items.count;
    
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary * group = self.groups[indexPath.section];
    NSArray * items = group[@"items"];
    NSDictionary *item = items[indexPath.row];
    MoreControllerCell *cell = [MoreControllerCell createCellWithTableView:tableView andItem:item];
    cell.item = item;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
}

#pragma mark -- UITableViewDelegate
//点击每个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ChangePasswordController *controller = [[ChangePasswordController alloc] init];
            [controller setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:controller animated:YES];
        } else if (indexPath.row == 1) {
            CommodityManagementController *controller = [[CommodityManagementController alloc] init];
            [controller setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:controller animated:YES];
        } else {
            StatisticsController *controller = [[StatisticsController alloc] init];
            [controller setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:controller animated:YES];
        }
    }
    
}


//每组的HeaderView的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}
//每组FooterView的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 40;
}

//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

#pragma mark -- headerView
- (UIView *)headerView {
    if (_headerView == nil) {
        _headerView = [[moreControllerHeaderView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 60)];
        _headerView.backgroundColor = [UIColor redColor];
    }
    return _headerView;
}

#pragma mark -- footerView
- (UIView *)footerView {
    if (_footerView == nil) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 60)];
        _footerView.backgroundColor = [UIColor whiteColor];
        UIButton *logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 5, [UIScreen mainScreen].bounds.size.width-40, 50)];
        [logoutButton setBackgroundColor:[UIColor redColor]];
        [logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
        [logoutButton addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:logoutButton];
    }
    return _footerView;
}

//退出按钮的点击事件
- (void)logout:(UIButton *)sender {
    
    LoginViewController *ovc=[LoginViewController new];
    UIAlertController *avc=[UIAlertController alertControllerWithTitle:@"是否要退出?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *act1=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self presentViewController:ovc animated:YES completion:nil];
    }];
    UIAlertAction *act2=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [avc addAction:act1];
    [avc addAction:act2];
    [self presentViewController:avc animated:YES completion:nil];
    
}

@end
