//
//  BWTableViewCell.h
//  tabDemo
//
//  Created by mortal on 15/12/7.
//  Copyright © 2016年 mortal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BWTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleL;

/** 加载自定义 cell */
+ (instancetype) loadCell;
@end
