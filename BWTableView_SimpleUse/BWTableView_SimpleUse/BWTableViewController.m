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

@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, assign) NSInteger curRow;
@property (nonatomic, weak) BWTableViewCell *selCell;

@end

@implementation BWTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BWTableViewCell *cell = [BWTableViewCell loadCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selCell = [tableView cellForRowAtIndexPath:indexPath];
    
    self.isOpen = !self.isOpen;
    self.selCell.titleL.textColor = [UIColor blackColor];
    
    if (self.curRow != indexPath.row) {
        self.isOpen = YES;
        self.selCell.titleL.textColor = [UIColor redColor];
    }
    self.curRow = indexPath.row;
    
    [tableView beginUpdates];
    [tableView endUpdates];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selCell.titleL.textColor = [UIColor blackColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.curRow == indexPath.row && self.isOpen ? 150 : 44;
}
@end
