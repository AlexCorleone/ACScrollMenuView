//
//  ViewController.m
//  ACScrollMenuView
//
//  Created by AlexCorleone on 2018/7/4.
//  Copyright © 2018年 AlexCorleone. All rights reserved.
//

#import "ACViewController.h"
#import "ACScrollMenuView.h"
#import "UIColor+ACAdd.h"
#import "ACSlider.h"

@interface ACViewController ()

@property (nonatomic, strong) ACScrollMenuView *scrollMenuView;

@end

@implementation ACViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.lightTextColor;
    
    {//设置显示x样式
        [ACScrollMenuConfig getDefaultConfig].scrollMenuStyle = ACScrollMenuItemStyleBottomLine;
        scrollMenuConfig.menuTitleSelectedColor = [UIColor AC_colorWithHexString:@"#FF7D35"];
    }

//    scrollMenuConfig.itemInsetForSection = 10;
    {//Item等宽显示
        scrollMenuConfig.itemWidth = @(([UIScreen mainScreen].bounds.size.width - [ACScrollMenuConfig getDefaultConfig].itemMiddleMargin * 5) / 4.0);
    }

    [self.view addSubview:self.scrollMenuView];
    [_scrollMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.equalTo(self.view);
        make.top.equalTo(self.view).offset(40);
        make.height.equalTo(@(45));
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
    
    //自定义进度条
    ACSlider *slider = [[ACSlider alloc] initWithFrame:CGRectMake(30, 120, 250, 40)];
    [slider setThumbImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
    slider.backgroundColor = UIColor.clearColor;
    [slider setValue:5 animated:YES];
    slider.maximumValue = 10.0;
    slider.minimumValue = 0.0;
    slider.barHeight = 11.0;
//    slider.barColors = @[(id)[UIColor redColor].CGColor,
//                         (id)[UIColor purpleColor].CGColor];
//    slider.barBackgroundColor = [UIColor whiteColor];
    [slider addTarget:self
               action:@selector(sliderDidChangeWith:)
     forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

#pragma mark - Target Action

- (void)sliderDidChangeWith:(ACSlider *)slider {
    
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
