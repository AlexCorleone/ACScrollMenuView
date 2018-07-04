//
//  ViewController.m
//  ACScrollMenuView
//
//  Created by AlexCorleone on 2018/7/4.
//  Copyright © 2018年 AlexCorleone. All rights reserved.
//

#import "ACViewController.h"
#import "ACScrollMenuView.h"

@interface ACViewController ()

@property (nonatomic, strong) ACScrollMenuView *scrollMenuView;

@end

@implementation ACViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.lightTextColor;
    
    NSLog(@"-----before Setting : %ld", [ACScrollMenuConfig getDefaultConfig].scrollMenuStyle);
//    [ACScrollMenuConfig getDefaultConfig].scrollMenuStyle = ACScrollMenuItemStyleBottomLine;
//    scrollMenuConfig.menuTitleSelectedColor = UIColor.purpleColor;
//    scrollMenuConfig.itemMiddleMargin = 0;
    NSLog(@"-----after Setting : %ld", [ACScrollMenuConfig getDefaultConfig].scrollMenuStyle);

    scrollMenuConfig.itemInsetForSection = 7;
    [self.view addSubview:self.scrollMenuView];
    [_scrollMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.equalTo(self.view);
        make.top.equalTo(self.view).offset(20);
        make.height.equalTo(@(30));
    }];
    NSArray *menuTitleArray = @[@"简友圈", @"作者", @"专题", @"连载", @"文集", @"推送更新", @"全部关注"];
    NSMutableArray *itemsArray = @[].mutableCopy;
    for (NSInteger i = 0 ; i < menuTitleArray.count; i++)
    {
        ACScrollMenuItem *menuItem = [ACScrollMenuItem new];
        menuItem.menuTitle = menuTitleArray[i];
        menuItem.ID = @(i + 1);
        [itemsArray addObject:menuItem];
    }
    [_scrollMenuView setSelectIndex:1];
    [_scrollMenuView setMenuDataSourceArray:itemsArray];
    [_scrollMenuView setDidSelectMenuItemBlock:^(ACScrollMenuItem *selectItem, NSInteger selectIndex) {
        NSLog(@"%@ ----- %ld", selectItem.menuTitle, selectIndex);
    }];
}

#pragma mark - setter && getter
- (ACScrollMenuView *)scrollMenuView
{
    if (!_scrollMenuView)
    {
        self.scrollMenuView = [ACScrollMenuView new];
    }
    return _scrollMenuView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
