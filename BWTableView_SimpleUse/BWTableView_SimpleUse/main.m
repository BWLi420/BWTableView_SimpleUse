//
//  main.m
//  BWTableView_SimpleUse
//
//  Created by mortal on 16/12/10.
//  Copyright © 2016年 mortal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        setenv("OS_ACTIVITY_MODE", "DISABLE", 1);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
