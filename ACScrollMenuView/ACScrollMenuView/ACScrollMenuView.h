//
//  ACScrollMenuView.h
//  ACScrollMenuView
//
//  Created by AlexCorleone on 2018/7/4.
//  Copyright © 2018年 AlexCorleone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACScrollMenuConfig.h"


@interface ACScrollMenuView : UIView

@property (nonatomic, assign) NSUInteger selectIndex;
@property (nonatomic, copy) NSArray<ACScrollMenuItem *> *menuDataSourceArray;
@property (nonatomic, copy) void (^didSelectMenuItemBlock)(ACScrollMenuItem *selectItem, NSInteger selectIndex);

@end
