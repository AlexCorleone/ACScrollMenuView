//
//  ACScrollMenuConfig.m
//  ACScrollMenuView
//
//  Created by AlexCorleone on 2018/7/4.
//  Copyright © 2018年 AlexCorleone. All rights reserved.
//

#import "ACScrollMenuConfig.h"
#import "UIColor+ACAdd.h"
#import "ACScrollMenuConfig.h"

#define ACNormalTextFont [UIFont systemFontOfSize:15]
#define ACNormalBGColor [UIColor AC_colorWithHexString:@"#FFFFFF"]
#define ACSelectedBGColor [UIColor AC_colorWithHexString:@"#FF7D35"]
#define ACNormalTextColor [UIColor AC_colorWithHexString:@"#BBBBBB"]
#define ACSelectedTextColor [UIColor AC_colorWithHexString:@"#FFFFFF"]
#define ACNormalBorderLineColor [UIColor AC_colorWithHexString:@"#BBBBBB"]
#define ACSelectedBorderLineColor [UIColor clearColor]
#define ACBottomLineColor [UIColor AC_colorWithHexString:@"#FF7D35"]

static ACScrollMenuConfig *scrollMenuConfigManager = nil;

@implementation ACScrollMenuConfig

+ (ACScrollMenuConfig *)getDefaultConfig
{
    if (!scrollMenuConfigManager)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            scrollMenuConfigManager = [ACScrollMenuConfig new];
            scrollMenuConfigManager.menuTitleFont = ACNormalTextFont;
            scrollMenuConfigManager.itemInsetForSection = 5;
            scrollMenuConfigManager.itemMiddleMargin = 10;
            scrollMenuConfigManager.menuItemBottomLineHeight = 1.5f;
            scrollMenuConfigManager.scrollMenuStyle = ACScrollMenuItemStyleDefault;
            scrollMenuConfigManager.menuTitleNormalColor = ACNormalTextColor;
            scrollMenuConfigManager.menuTitleSelectedColor = ACSelectedTextColor;
            /*
             * ACScrollMenuItemStyleDefault 下的默认样式配置
             */
            scrollMenuConfigManager.menuItemNormalBGColor = ACNormalBGColor;
            scrollMenuConfigManager.menuItemSelectedBGColor = ACSelectedBGColor;
            
            scrollMenuConfigManager.menuNormalBorderLineColor = ACNormalBorderLineColor;
            scrollMenuConfigManager.menuSelectedBorderLineColor = ACSelectedBorderLineColor;
            /*
             * ACScrollMenuItemStyleBottomLine 下的默认样式配置
             */
            scrollMenuConfigManager.menuItemSelectedBottomLineColor = ACBottomLineColor;
            scrollMenuConfigManager.menuItemNormalBottomLineColor = [UIColor clearColor];
        });
    }
    return scrollMenuConfigManager;
}

@end

@interface ACScrollMenuItem ()
/*选中文字长度*/
@property (nonatomic, strong) NSNumber *menuTitleSelectWidth;
/*非选中文字长度*/
@property (nonatomic, strong) NSNumber *menuTitleNormalWidth;


@end

@implementation ACScrollMenuItem

- (NSNumber *)menuTitleNormalWidth
{
    if (!_menuTitleNormalWidth)
    {
        _menuTitleNormalWidth = @([self.menuTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, 30)
                                                               options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                            attributes:@{NSFontAttributeName:scrollMenuConfig.menuTitleFont}
                                                               context:nil].size.width + 20);
    }
    return _menuTitleNormalWidth;
}

- (NSNumber *)menuTitleSelectWidth
{
    if (!_menuTitleSelectWidth)
    {
        _menuTitleSelectWidth = @([self.menuTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, 30)
                                                               options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                            attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:scrollMenuConfig.menuTitleFont.pointSize + selectedFoneReuce]}
                                                               context:nil].size.width + 20);
    }
    return _menuTitleSelectWidth;
    
}

- (NSNumber *)menuTitleWidth
{
    if (scrollMenuConfigManager.itemWidth != nil) {
        return scrollMenuConfigManager.itemWidth;
    }
    if (self.isSelected && (scrollMenuConfig.scrollMenuStyle & ACScrollMenuItemStyleBottomLine))
    {
        return self.menuTitleSelectWidth;
    }else
    {
        return self.menuTitleNormalWidth;
    }
}

@end

