//
//  BWTableViewCell.m
//  tabDemo
//
//  Created by mortal on 15/12/7.
//  Copyright © 2016年 mortal. All rights reserved.
//

#import "BWTableViewCell.h"

@implementation BWTableViewCell

+ (instancetype)loadCell {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

@end
