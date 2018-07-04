//
//  ACScrollMenuConfig.h
//  ACScrollMenuView
//
//  Created by AlexCorleone on 2018/7/4.
//  Copyright © 2018年 AlexCorleone. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ACScrollMenuItemStyle) {
    ACScrollMenuItemStyleDefault = 1 << 0 ,//背景色和边线
    ACScrollMenuItemStyleBottomLine = 1 << 1, //底部下划线
};

#define scrollMenuConfig [ACScrollMenuConfig getDefaultConfig]
@interface ACScrollMenuConfig : NSObject

@property (nonatomic, assign) ACScrollMenuItemStyle scrollMenuStyle;

/*
 * 分区上线的内边距、 默认10;
 */
@property (nonatomic, assign) CGFloat itemInsetForSection;

/*
 * Item左右的间距 默认10;
 */
@property (nonatomic, assign) CGFloat itemMiddleMargin;

/*
 * Item的文字字体
 */
@property (nonatomic, strong) UIFont  *menuTitleFont;

/*
 * Item的文字的默认颜色
 */
@property (nonatomic, strong) UIColor *menuTitleNormalColor;

/*
 * Item的文字的选中颜色
 */
@property (nonatomic, strong) UIColor *menuTitleSelectedColor;

/*
 * Item的背景的边线颜色
 */
@property (nonatomic, strong) UIColor *menuNormalBorderLineColor;

/*
 * Item的背景的边线选中颜色
 */
@property (nonatomic, strong) UIColor *menuSelectedBorderLineColor;

/*
 * Item的正常背景色
 */
@property (nonatomic, strong) UIColor *menuItemNormalBGColor;

/*
 * Item的选中背景色
 */
@property (nonatomic, strong) UIColor *menuItemSelectedBGColor;

/*
 * Item的底部边线的选中颜色
 */
@property (nonatomic, strong) UIColor *menuItemSelectedBottomLineColor;

/*
 * Item的底部边线的非选中颜色
 */
@property (nonatomic, strong) UIColor *menuItemNormalBottomLineColor;

/*
 * 底部线条的高度、 默认1.f;
 */
@property (nonatomic, assign) CGFloat menuItemBottomLineHeight;

+ (ACScrollMenuConfig *)getDefaultConfig;


@end


#define selectedFoneReuce (1.5)
@interface ACScrollMenuItem : NSObject

@property (nonatomic, strong) NSNumber *ID;
@property (nonatomic, copy)  NSString *menuTitle;
@property (nonatomic, assign)  BOOL isSelected;
/*文字长度*/
@property (nonatomic, strong) NSNumber *menuTitleWidth;

@end

