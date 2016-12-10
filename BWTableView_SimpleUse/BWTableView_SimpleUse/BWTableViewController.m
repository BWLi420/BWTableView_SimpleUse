//
//  ViewController.m
//  tabDemo
//
//  Created by mortal on 15/12/7.
//  Copyright © 2016年 mortal. All rights reserved.
//

#import "BWTableViewController.h"
#import "BWTableViewCell.h"

@interface BWTableViewController ()

/** 记录 cell 是否打开 */
@property (nonatomic, assign) BOOL isOpen;
/** 记录当前点击的 cell 行数 */
@property (nonatomic, assign) NSInteger curRow;
/** 记录选择的 cell */
@property (nonatomic, weak) BWTableViewCell *selCell;

@end

@implementation BWTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 设置内边距 */
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 加载自定义 cell */
    BWTableViewCell *cell = [BWTableViewCell loadCell];
    /** 取消 cell 的选中状态 */
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

/** 选中 cell 时调用 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selCell = [tableView cellForRowAtIndexPath:indexPath];
    
    /** 业务逻辑 */
    self.isOpen = !self.isOpen;
    /** 标题初始文字颜色 */
    self.selCell.titleL.textColor = [UIColor blackColor];
    
    if (self.curRow != indexPath.row) {
        self.isOpen = YES;
        /** cell 展开时标题设置为红色 */
        self.selCell.titleL.textColor = [UIColor redColor];
    }
    self.curRow = indexPath.row;
    
    /** 刷新tableView，系统默认会有一个自带的动画 */
    [tableView beginUpdates];
    [tableView endUpdates];
}

/** 取消选中 cell 时调用 */
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 取消选中时，cell 处于关闭状态，标题改为初始黑色 */
    self.selCell.titleL.textColor = [UIColor blackColor];
}

/** 设置 cell 的高度 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 判断记录的行号是否为当前点击行 且 是否处于展开状态 */
    return self.curRow == indexPath.row && self.isOpen ? 150 : 44;
}
@end
